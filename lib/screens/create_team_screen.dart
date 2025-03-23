import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';
import 'package:team_finder_app/widgets/nav_bar.dart';

class CreateTeamScreen extends StatefulWidget {
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teamNameController = TextEditingController();
  String? _selectedSport;

  void _createTeam(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        _showMessage("User not logged in!", Colors.red);
        return;
      }

      try {
        await FirebaseFirestore.instance.collection('teams').add({
          'name': _teamNameController.text.trim(),
          'sport': _selectedSport,
          'creatorId': user.uid,
          'members': [user.uid], // Automatically enroll creator
        });

        _showMessage("Team Created Successfully!", Colors.green);
        Navigator.pushReplacementNamed(context, '/findTeams'); // Redirect to Find Teams page
      } catch (e) {
        _showMessage("Error creating team: ${e.toString()}", Colors.red);
      }
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.createTeamLabel)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Create Your Team',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _teamNameController,
                decoration: InputDecoration(
                  labelText: 'Team Name',
                  prefixIcon: Icon(Icons.group, color: AppConstants.primaryColor),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Please enter a team name' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Sport',
                  prefixIcon: Icon(Icons.sports_soccer, color: AppConstants.primaryColor),
                  border: OutlineInputBorder(),
                ),
                items: AppConstants.sports.map((sport) {
                  return DropdownMenuItem(
                    value: sport,
                    child: Text(sport),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Please select a sport' : null,
                onChanged: (value) => setState(() => _selectedSport = value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _createTeam(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Create Team",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
