import 'package:flutter/material.dart';
import '../main.dart'; // We need this to navigate to the MainNavigator

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Wait for 2.5 seconds to simulate a boot-up sequence
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    
    // Navigate to the main app and remove the splash screen from history
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigator()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, size: 80, color: Colors.teal),
            const SizedBox(height: 20),
            const Text(
              'INITIALIZING SECURE ENVIRONMENT',
              style: TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'Courier',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // A linear loading bar that matches your tech theme
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[800],
                color: Colors.teal,
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}