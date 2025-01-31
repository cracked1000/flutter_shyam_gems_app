// seller_dashboard.dart
import 'package:flutter/material.dart';
import "package:shyam_gems_app/screens/feed.dart";
import 'package:shyam_gems_app/screens/seller-account.dart';
import 'package:shyam_gems_app/screens/settings.dart';
import 'package:shyam_gems_app/screens/inbox.dart';
import 'package:shyam_gems_app/colours.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  int _selectedIndex = 0;

  // Reference your screens from separate files
  final List<Widget> _screens = [
     SellerAccount(), // This can be in seller_home.dart
     Feedpage(),       // From feed.dart
     Settingspage(),   // From settings.dart
     InboxPage(),      // From inbox.dart
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(data: NavigationBarThemeData(
        height: 65,
          backgroundColor: Colours.Navbar_background,
          indicatorColor: Colours.secondary
      ), child: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
          NavigationDestination(
            icon: Icon(Icons.dynamic_feed_outlined),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: 'Inbox',
          ),
        ],
      ),
      ),
    );
  }
}