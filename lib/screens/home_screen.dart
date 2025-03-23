import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';
import 'package:team_finder_app/widgets/nav_bar.dart';
import 'package:team_finder_app/widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.homeWelcomeText),
        leading: Icon(Icons.sports_soccer),
      ),
      body: HomeContent(),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
