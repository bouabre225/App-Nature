import 'package:flutter/material.dart';
import 'screens/discover_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const PlantApp());

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans-serif', useMaterial3: true),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const DiscoverScreen(),
    const WeatherScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF007D40),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15, offset: const Offset(0, 8))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleHome(),
                  _navItem(0, Icons.eco, "Plants"),
                  _navItem(1, Icons.wb_sunny_outlined, "Care"),
                  _navItem(2, Icons.person_outline, "Profile"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleHome() => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
    child: const Icon(Icons.home_filled, color: Colors.white, size: 22),
  );

  Widget _navItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF007D40) : Colors.white, size: 22),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Color(0xFF007D40), fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ],
        ),
      ),
    );
  }
}