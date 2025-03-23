import 'package:flutter/material.dart';
import 'package:team_finder_app/core/theme.dart';
import 'package:team_finder_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TeamFinderApp());
}

class TeamFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team Finder',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
