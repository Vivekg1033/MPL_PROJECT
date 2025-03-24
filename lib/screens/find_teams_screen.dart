import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';
import 'package:team_finder_app/widgets/nav_bar.dart';
import 'package:team_finder_app/widgets/team_card.dart';
import 'package:team_finder_app/models/team.dart';

class FindTeamsScreen extends StatefulWidget {
  @override
  _FindTeamsScreenState createState() => _FindTeamsScreenState();
}

class _FindTeamsScreenState extends State<FindTeamsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;
  bool _showJoinedTeams = false; // Toggle for filtering

  Stream<QuerySnapshot> _getTeams() {
    if (_showJoinedTeams) {
      return _firestore
          .collection('teams')
          .where('members', arrayContains: _currentUser!.uid) // Fetch only joined teams
          .snapshots();
    } else {
      return _firestore.collection('teams').snapshots(); // Fetch all teams
    }
  }

  void _toggleJoinTeam(String teamId, List<String> members) async {
    if (_currentUser == null) return;

    bool isJoined = members.contains(_currentUser!.uid);
    List<String> updatedMembers = isJoined
        ? members.where((id) => id != _currentUser!.uid).toList()
        : [...members, _currentUser!.uid];

    try {
      DocumentReference teamRef = _firestore.collection('teams').doc(teamId);
      DocumentReference userRef = _firestore.collection('users').doc(_currentUser!.uid);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot teamSnapshot = await transaction.get(teamRef);
        DocumentSnapshot userSnapshot = await transaction.get(userRef);

        if (!teamSnapshot.exists) {
          print("Error: Team document not found!");
          return;
        }

        transaction.update(teamRef, {'members': updatedMembers});
        transaction.update(userRef, {
          'joinedTeams': isJoined
              ? FieldValue.arrayRemove([teamId])
              : FieldValue.arrayUnion([teamId])
        });
      });

      setState(() {}); // Refresh UI after update
    } catch (e) {
      print("Error updating team members: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.findTeamsLabel),
        actions: [
          IconButton(
            icon: Icon(_showJoinedTeams ? Icons.visibility_off : Icons.visibility),
            tooltip: _showJoinedTeams ? "Show All Teams" : "Show Joined Teams",
            onPressed: () {
              setState(() {
                _showJoinedTeams = !_showJoinedTeams; // Toggle filter
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getTeams(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var teams = snapshot.data!.docs.map((doc) {
            var data = doc.data() as Map<String, dynamic>;
            return Team(
              id: doc.id,
              name: data['name'],
              sport: data['sport'],
              creatorId: data['creatorId'],
              members: List<String>.from(data['members']),
            );
          }).toList();

          if (teams.isEmpty) {
            return Center(
              child: Text(
                _showJoinedTeams ? "No joined teams found" : "No teams available",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              var team = teams[index];
              bool isJoined = team.members.contains(_currentUser?.uid);

              return TeamCard(
                team: team,
                isJoined: isJoined,
                onJoinToggle: (teamId, members) => _toggleJoinTeam(teamId, members),
              );
            },
          );
        },
      ),
      bottomNavigationBar: NavBar(currentIndex: 2),
    );
  }
}
