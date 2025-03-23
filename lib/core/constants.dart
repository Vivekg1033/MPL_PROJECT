import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = "Team Finder";
  static const String homeWelcomeText = "Welcome to Team Finder";
  static const String homeDescription =
      "Find and join local teams for practice, form your own team, and connect with fellow athletes.";

  // Navigation Labels
  static const String createTeamLabel = "Create a Team";
  static const String findTeamsLabel = "Find Teams";
  static const String chatLabel = "Chat";

  // Sports List
  static const List<String> sports = [
    'Football',
    'Basketball',
    'Cricket',
    'Tennis'
  ];

  // Default Colors
  static const Color primaryColor = Color(0xFF0D47A1); // Blue[900]
  static const Color secondaryColor = Color(0xFF1976D2); // Blue[700]
  static const Color buttonColor = Color(0xFF81D4FA); // LightBlue[200]
}
