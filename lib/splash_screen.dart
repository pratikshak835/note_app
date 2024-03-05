import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/home_page.dart'; // Import your main screen widget

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2), // Change the duration as needed
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const HomePage()), // Navigate to the main screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/dna1.jfif'),
          fit: BoxFit.fill,
        )),
        // child: Image.asset(
        //   height: 1000,
        //   'assets/dna1.jpg',
        // ),
      ),
    );
  }
}
