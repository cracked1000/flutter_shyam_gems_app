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
  final List<Widget> _screens = [
     SellerAccount(),
     Feedpage(),
     Settingspage(),
     InboxPage(),
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