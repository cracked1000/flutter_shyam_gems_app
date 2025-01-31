import 'package:flutter/material.dart';
import 'package:shyam_gems_app/screens/inbox.dart';
import 'package:shyam_gems_app/screens/post_requirement.dart';
import 'package:shyam_gems_app/screens/client-account.dart';
import 'package:shyam_gems_app/screens/feed.dart';
import 'package:shyam_gems_app/screens/seller-account.dart';
import 'package:shyam_gems_app/seller_dashboard.dart';
import 'package:shyam_gems_app/screens/signup.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      theme: ThemeData.light(), // Light mode
      home: LoginScreen(),
    );
  }
}
