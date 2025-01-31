import 'package:flutter/material.dart';
import 'package:shyam_gems_app/colours.dart';
import 'package:shyam_gems_app/screens/login_screen.dart';

class Settingspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check the current theme mode
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colours.darkmode : Colours.background,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colours.Appbar_darkmode : Colors.white,
        elevation: 0,
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: isDarkMode ? Colours.secondary : Colours.secondary,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Settings Block
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSettingRow('Edit profile', isDarkMode),
                  const SizedBox(height: 20),
                  buildSettingRow('Change password', isDarkMode),
                  const SizedBox(height: 20),
                  buildSettingRow('Change Username', isDarkMode),
                  const SizedBox(height: 30),
                  Divider(color: isDarkMode ? Colors.white54 : Colors.black),
                ],
              ),
            ),

            // More Settings Block
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.grey[400] : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSettingRow('Push Notification', isDarkMode),
                  const SizedBox(height: 20),
                  buildSettingRow('About us', isDarkMode),
                  const SizedBox(height: 20),
                  buildSettingRow('Privacy Policy', isDarkMode),
                  const SizedBox(height: 30),
                  Divider(color: isDarkMode ? Colors.white54 : Colors.black),
                ],
              ),
            ),

            // Logout Button
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                        (route) => false,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingRow(String title, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: isDarkMode ? Colors.white : Colors.black,
          size: 20,
        ),
      ],
    );
  }
}