import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';
import 'package:team_finder_app/widgets/nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  void _logout(BuildContext context) {
    // Handle logout logic here (clear user session, etc.)
    Navigator.pushReplacementNamed(context, '/'); // Redirect to login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppConstants.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.logout, color: AppConstants.primaryColor),
              title: Text("Logout", style: TextStyle(fontSize: 18)),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 4), // Add Settings as a tab
    );
  }
}
