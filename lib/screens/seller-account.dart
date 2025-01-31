import 'package:flutter/material.dart';
import 'package:shyam_gems_app/colours.dart';

class SellerAccount extends StatelessWidget {
  const SellerAccount({super.key});

  void _showImageDetail(BuildContext context, Map<String, String> item, bool isDarkMode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDarkMode ? Colours.darkmode : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        item["image"]!,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["title"]!,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["subtitle"]!,
                        style: TextStyle(
                          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Add more details here as needed
                      DetailRow(
                        icon: Icons.diamond_outlined,
                        title: "Quality",
                        value: "AAA Grade",
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 8),
                      DetailRow(
                        icon: Icons.balance,
                        title: "Weight",
                        value: "3.5 Carats",
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 8),
                      DetailRow(
                        icon: Icons.public,
                        title: "Origin",
                        value: "Tanzania",
                        isDarkMode: isDarkMode,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Natural sapphire with excellent clarity and color. Perfect for premium jewelry pieces.",
                        style: TextStyle(
                          color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.yellow[700]!, width: 2),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.person, color: Colors.yellow, size: 40),
                        ),
                      ),
                      const SizedBox(width: 15),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colours.darkmode : Colours.primary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
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


            Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 600 ? 4 : 3;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
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
                      return GestureDetector(
                        onTap: () => _showImageDetail(context, item, isDarkMode),
                        child: Container(
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
                        ),
                      );
                    },
                  );
                },
              ),
            ),

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

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool isDarkMode;

  const DetailRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.isDarkMode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          "$title: ",
          style: TextStyle(
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}