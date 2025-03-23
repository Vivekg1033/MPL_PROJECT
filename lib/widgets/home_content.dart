import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/team_finder_logo.png', height: 150), // Display logo
          ),
          Text(
            AppConstants.appName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.primaryColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            AppConstants.homeDescription,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppConstants.secondaryColor),
          ),
          SizedBox(height: 20),
          _buildActionButton(
            context,
            icon: Icons.add,
            label: AppConstants.createTeamLabel,
            route: '/createTeam',
          ),
          SizedBox(height: 10),
          _buildActionButton(
            context,
            icon: Icons.search,
            label: AppConstants.findTeamsLabel,
            route: '/findTeams',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppConstants.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
