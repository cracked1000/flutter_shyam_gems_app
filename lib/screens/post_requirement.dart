import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shyam_gems_app/colours.dart';

class PostRequirementScreen extends StatefulWidget {
  const PostRequirementScreen({Key? key}) : super(key: key);

  @override
  State<PostRequirementScreen> createState() => _PostRequirementScreenState();
}

class _PostRequirementScreenState extends State<PostRequirementScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _requirement;
  String? _description;
  File? _image;

  @override
  Widget build(BuildContext context) {
    // Check the current theme mode
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colours.darkmode : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colours.Appbar_darkmode : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colours.secondary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'POST REQUIREMENT',
          style: TextStyle(
            color: isDarkMode ? Colours.secondary : Colours.secondary,
            fontWeight: FontWeight.w900,fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTextFormField(
                  'Requirement',
                  1,
                  isDarkMode,
                  onSaved: (value) => _requirement = value,
                ),
                const SizedBox(height: 16),
                buildTextFormField(
                  'Description',
                  4,
                  isDarkMode,
                  onSaved: (value) => _description = value,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _image == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 32,
                          color: isDarkMode ? Colors.grey[400] : Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'UPLOAD PHOTO',
                          style: TextStyle(
                            color: isDarkMode ? Colors.grey[400] : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                        : Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colours.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'POST',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String hint, int maxLines, bool isDarkMode, {required Function(String?) onSaved}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      maxLines: maxLines,
      onSaved: onSaved,
    );
  }
}