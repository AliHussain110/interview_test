import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speedforce_interview/theme/colors.dart';
import '../homepage/homepage.dart';
import '../profile/myprofile.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Earning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type:
              BottomNavigationBarType.fixed, // Ensures labels are always shown
          selectedItemColor: AppColors.primaryColor, // Color for selected item
          unselectedItemColor: Colors.grey, // Color for unselected items
          showSelectedLabels: true, // Show labels for selected items
          showUnselectedLabels: true, // Show labels for unselected items
          elevation: 0, // Remove shadow
        ),
      ),
    );
  }
}
