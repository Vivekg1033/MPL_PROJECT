import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';
import 'package:team_finder_app/models/team.dart';
import 'package:team_finder_app/screens/team_details_screen.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final bool isJoined;
  final Function(String, List<String>) onJoinToggle;

  const TeamCard({
    required this.team,
    required this.isJoined,
    required this.onJoinToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          team.name,
          style: TextStyle(
            color: AppConstants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          team.sport,
          style: TextStyle(color: AppConstants.secondaryColor),
        ),
        trailing: ElevatedButton(
          onPressed: () => onJoinToggle(team.id, team.members),
          style: ElevatedButton.styleFrom(
            backgroundColor: isJoined ? AppConstants.primaryColor : AppConstants.buttonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            isJoined ? 'Leave' : 'Join',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeamDetailsScreen(teamId: team.id)),
          );
        },
      ),
    );
  }
}
