import 'package:flutter/material.dart';
import 'package:shyam_gems_app/colours.dart';
import 'package:shyam_gems_app/screens/post_requirement.dart';

class Feedpage extends StatelessWidget {
  const Feedpage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check the current theme mode
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colours.Appbar_darkmode : Colors.white,
        elevation: 0,
        title: Text(
          "FEED",
          style: TextStyle(
            color: isDarkMode ? Colours.secondary : Colours.secondary,
            fontWeight: FontWeight.w900,fontSize: 24,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostRequirementScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 200,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isDarkMode ? Colours.secondary : Colours.secondary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.edit_outlined,
                    color: isDarkMode ? Colors.white : Colours.primary,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Post a requirement',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: isDarkMode ? Colours.darkmode: Colours.background,
      body: SafeArea(
        child: ListView(
          children: [
            buildFeedItem(
              "@matstonie",
              "Requirement for blue sapphire above 3 cts",
              isDarkMode ? Colours.secondary : Colours.secondary,
              isDarkMode,
            ),
            buildFeedItem(
              "@carl",
              "Requirement for blue sapphire above 5 cts with certificates",
              isDarkMode ? Colours.secondary : Colours.secondary,
              isDarkMode,
            ),
            buildFeedItemWithImage(
              "@matstonie",
              "Requirement for blue sapphire above 3 cts",
              "Blue sapphire 3.10ct",
              isDarkMode ? Colours.primary_shade : Colours.primary,
              isDarkMode,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeedItem(String username, String requirement, Color color, bool isDarkMode) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: color,
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colours.background,
                  ),
                ),
                Text(
                  requirement,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeedItemWithImage(String username, String requirement, String caption, Color color, bool isDarkMode) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: color,
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Replying to $username",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colours.background,
                  ),
                ),
                Text(
                  requirement,
                  style: const TextStyle(color: Colors.white),
                ),
                const Image(image: AssetImage('Assets/Images/images.jpeg')),
                Text(
                  caption,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}