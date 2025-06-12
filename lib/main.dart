import 'package:flutter/material.dart';
import 'package:memes_flutter/screens/memes_home_page.dart';

void main() {
  runApp(MemeApp());
}

class MemeApp extends StatelessWidget {
  const MemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Meme App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          // Updated text styles based on Flutter 3.x naming conventions
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white, // For headline text
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.white, // For larger body text
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.white70, // Slightly smaller and lighter body text
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          const MemesHomePage(), // Ensure home is set to the MemesHomePage widget
    );
  }
}
