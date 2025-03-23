import 'package:flutter/material.dart';
import 'package:team_finder_app/screens/login_screen.dart';
import 'package:team_finder_app/screens/signup_screen.dart';
import 'package:team_finder_app/screens/home_screen.dart';
import 'package:team_finder_app/screens/create_team_screen.dart';
import 'package:team_finder_app/screens/find_teams_screen.dart';
import 'package:team_finder_app/screens/chat_screen.dart';
import 'package:team_finder_app/screens/settings_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/signup': (context) => SignupScreen(),
  '/home': (context) => HomeScreen(),
  '/createTeam': (context) => CreateTeamScreen(),
  '/findTeams': (context) => FindTeamsScreen(),
  '/chat': (context) => ChatScreen(),
  '/settings': (context) => SettingsScreen(),
};
