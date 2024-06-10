import 'package:flutter/material.dart';
import 'dart:async';

import 'buttons_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some startup delay
    Timer(const Duration(seconds: 3), () {
      // Navigate to the home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const ButtonsListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'), // Add your logo image here
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
