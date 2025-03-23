import 'package:flutter/material.dart';
import 'package:team_finder_app/core/constants.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: AppConstants.secondaryColor,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/createTeam');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/findTeams');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/chat');
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/settings');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.group_add), label: 'Create Team'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Find Teams'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
