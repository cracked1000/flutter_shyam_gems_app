import 'package:flutter/material.dart';
import 'package:shyam_gems_app/colours.dart';

class ClientAccount extends StatelessWidget {
  const ClientAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colours.darkmode: Colours.lightmode,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colours.darkmode: Colours.lightmode,
        title: Text(
          "CLIENT ACCOUNT",
          style: TextStyle(
            color: isDarkMode ? Colours.secondary : Colours.secondary,
            fontWeight: FontWeight.w900,fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colours.secondary : Colours.secondary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 200,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colours.secondary : Colours.secondary,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 35),
                        Container(
                          height: 200,
                          width: 10,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colours.primary : Colours.primary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 200,
                          width: 10,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colours.primary : Colours.primary,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
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
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Experience",
                                style: TextStyle(
                                  color: Colors.yellow[700],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "10+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Sourcing gems from tanzania",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colours.primary : Colours.primary,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: const Text(
                      "EDIT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}