import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_finder_app/core/constants.dart';

class TeamDetailsScreen extends StatelessWidget {
  final String teamId;

  const TeamDetailsScreen({required this.teamId});

  Future<DocumentSnapshot> _fetchTeamDetails() {
    return FirebaseFirestore.instance.collection('teams').doc(teamId).get();
  }

  Future<List<DocumentSnapshot>> _fetchTeamMembers(List<String> memberIds) async {
    if (memberIds.isEmpty) return [];
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', whereIn: memberIds)
        .get();
    return users.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Team Details")),
      body: FutureBuilder<DocumentSnapshot>(
        future: _fetchTeamDetails(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var teamData = snapshot.data!.data() as Map<String, dynamic>;
          String creatorId = teamData['creatorId'];
          List<String> members = List<String>.from(teamData['members'] ?? []);

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamData['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppConstants.primaryColor),
                ),
                SizedBox(height: 10),
                Text(
                  "Sport: ${teamData['sport']}",
                  style: TextStyle(fontSize: 18, color: AppConstants.secondaryColor),
                ),
                SizedBox(height: 20),
                Text(
                  "Members:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: FutureBuilder<List<DocumentSnapshot>>(
                    future: _fetchTeamMembers(members),
                    builder: (context, memberSnapshot) {
                      if (!memberSnapshot.hasData) return Center(child: CircularProgressIndicator());

                      var memberDocs = memberSnapshot.data!;
                      return ListView.builder(
                        itemCount: memberDocs.length,
                        itemBuilder: (context, index) {
                          var userData = memberDocs[index].data() as Map<String, dynamic>;
                          bool isCreator = userData['uid'] == creatorId;

                          return ListTile(
                            leading: Icon(Icons.person, color: AppConstants.primaryColor),
                            title: Text(
                              userData['fullName'],
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(userData['email']),
                            trailing: isCreator
                                ? Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppConstants.primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "Creator",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : null,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
