import 'package:flutter/material.dart';
import 'package:shyam_gems_app/screens/login_screen.dart';
import 'package:shyam_gems_app/client_dashboard.dart';
import 'package:shyam_gems_app/seller_dashboard.dart';
import '../colours.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      if (_selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a role (Seller or Client)')),
        );
        return;
      }

      // Navigate to appropriate dashboard based on role
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _selectedRole == 'seller'
              ? const SellerDashboard()
              : const ClientDashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colours.darkmode : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: Image.asset('Assets/Images/Logo.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'SIGN-UP FORM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  buildTextFormField('Full Name', false, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Email', false, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Username', false, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Mobile No', false, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Password', true, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Confirm Password', true, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Experience', false, isDarkMode),
                  SizedBox(height: 15),
                  buildTextFormField('Bio', false, isDarkMode),
                  SizedBox(height: 30),

                  // Role selection buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedRole = 'seller';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedRole == 'seller'
                              ? Colours.primary_shade
                              : Colours.secondary,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                        child: Text(
                          'SELLER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedRole = 'client';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedRole == 'client'
                              ? Colours.primary_shade
                              : Colours.secondary,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                        child: Text(
                          'CLIENT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Sign Up button
                  ElevatedButton(
                    onPressed: _handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colours.secondary,
                      minimumSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'SIGN-UP',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: isDarkMode ? Colors.blue[300] : Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String label, bool isPassword, bool isDarkMode) {
    return TextFormField(
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.grey[600]! : Colors.grey[400]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.white : Colors.blue,
          ),
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.white,
      ),
    );
  }
}