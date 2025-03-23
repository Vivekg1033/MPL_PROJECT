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

  void _toggleJoinTeam(String teamId, List<String> members) async {
    if (_currentUser == null) return;

    bool isJoined = members.contains(_currentUser!.uid);
    List<String> updatedMembers = isJoined
        ? members.where((id) => id != _currentUser!.uid).toList()  // Remove user
        : [...members, _currentUser!.uid];  // Add user

    try {
      DocumentReference teamRef = _firestore.collection('teams').doc(teamId);
      DocumentSnapshot teamSnapshot = await teamRef.get();

      if (!teamSnapshot.exists) {
        print("Error: Team document not found!");
        return;
      }

      await teamRef.update({'members': updatedMembers});
      setState(() {});  // Refresh UI after update
    } catch (e) {
      print("Error updating team members: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.findTeamsLabel)),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('teams').snapshots(),
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
