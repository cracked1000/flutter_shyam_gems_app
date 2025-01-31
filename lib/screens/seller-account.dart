import 'package:flutter/material.dart';
import 'package:shyam_gems_app/colours.dart';

class SellerAccount extends StatelessWidget {
  const SellerAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // Check the current theme mode
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colours.darkmode : Colours.lightmode,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colours.darkmode : Colours.lightmode,
        title: Text(
          "SELLER ACCOUNT",
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
            // Profile Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDarkMode ? Colours.primary_shade : Colours.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Profile Picture
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.yellow[700]!, width: 2),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                              Icons.person, color: Colors.yellow, size: 40),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Name and Username
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "@Shahul12",
                            style: TextStyle(
                              color: Colors.yellow[700],
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Shahul Hameed",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Edit Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colours.darkmode : Colours.primary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.3)),
                        ),
                        child: Text(
                          "EDIT",
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Experience
                  Row(
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                          color: Colors.yellow[700],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "10+",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Location
                  Text(
                    "Sourcing gems from tanzania",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // Gallery Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "GALLERY",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : const Color(0xFF4A332F),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Gallery Grid with unique items
            Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Adjust the crossAxisCount based on screen width
                  final crossAxisCount = constraints.maxWidth > 600 ? 4 : 3;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 3, // Number of gallery items
                    itemBuilder: (context, index) {
                      // Define your gallery items here
                      final List<Map<String, String>> galleryItems = [
                        {
                          "image": "Assets/Images/Blue_Sapphire_gemstone.jpg",
                          "title": "Royal Blue",
                          "subtitle": "Premium Quality",
                        },
                        {
                          "image": "Assets/Images/sapphire 2.webp",
                          "title": "Ceylon Blue",
                          "subtitle": "Natural Sapphire",
                        },
                        {
                          "image": "Assets/Images/sapphire-blue.webp",
                          "title": "Tanzanian Blue",
                          "subtitle": "Rare Collection",
                        },
                      ];

                      final item = galleryItems[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item["image"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item["subtitle"]!,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Upload Button
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colours.secondary : Colours.secondary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "UPLOAD",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}