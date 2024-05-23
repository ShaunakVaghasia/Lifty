import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.fitness_center_rounded), label: 'Workouts'),
        NavigationDestination(icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
      ],
    );
  }
}
