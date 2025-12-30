import 'package:app_nature/screens/plants_screen.dart';
import 'package:app_nature/screens/profile_screen.dart';

import 'home_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget{
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>{
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const PlantsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: _screens[_currentIndex],
     bottomNavigationBar: Container(
       decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.black,
             blurRadius: 10,
             offset: const Offset(0, -5),
           ),
         ],
       ),
       child: BottomNavigationBar(
           currentIndex: _currentIndex,
           onTap: (index){
             setState(() {
               _currentIndex = index;
             });
           },
         items: [
           BottomNavigationBarItem(
             icon: Container(
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 shape: BoxShape.circle,
               ),
               child: const Icon(Icons.home, size: 24),
             ),
             label: '',
           ),
           BottomNavigationBarItem(
             icon: Container(
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 shape: BoxShape.circle,
               ),
               child: const Icon(Icons.eco, size: 24),
             ),
             label: '',
           ),
           BottomNavigationBarItem(
             icon: Container(
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 shape: BoxShape.circle,
               ),
               child: const Icon(Icons.person, size: 24),
             ),
             label: '',
           ),
         ],
       ),
     ),
   );
  }
}