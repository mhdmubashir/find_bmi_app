import 'dart:async';

import 'package:bmi_calculator_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pixclue Studios ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thin font weight
              ),
            ),
            Text(
              '© 2024',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300, // Thin font weight
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToHome() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );
      },
    );
  }
}
