import 'package:flutter/material.dart';
import 'home.dart';
import 'care.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const DiscoverYourPlantPage(),
    const WeatherPlantPage(),
    const ProfileVegetablesPage()
  ];

  void _onNavItemTapped(int index) {
      setState(() {
        currentIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, 
        children: pages
      ),
      bottomNavigationBar: _onBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _onBottomNav() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildNavItem(Icons.home_rounded, 0),
          SizedBox(width: 20),
          _buildNavItem(Icons.local_florist, 1),
          SizedBox(width: 20),
          _buildNavItem(Icons.person, 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isActive = currentIndex == index;

      return GestureDetector(
      onTap: () => _onNavItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? Colors.green.shade600 : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(
          icon,
          size: 26,
          color: isActive ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}
