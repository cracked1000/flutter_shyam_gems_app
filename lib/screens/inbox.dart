import 'package:flutter/material.dart';
import 'package:shyam_gems_app/colours.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colours.darkmode : Colours.background,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colours.Appbar_darkmode : Colours.lightmode,
        title: Text(
          "INBOX",
          style: TextStyle(
            color: isDarkMode ? Colours.secondary : Colours.secondary, fontWeight: FontWeight.w900,fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildMessageItem(
              "@matstonie",
              "Sent a message",
              isDarkMode,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageItem(String username, String message, bool isDarkMode) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colours.lightmode,
        border: Border(
          bottom: BorderSide(
            color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colours.secondary,
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colours.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}