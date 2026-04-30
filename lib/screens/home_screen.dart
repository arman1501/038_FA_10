import 'package:flutter/material.dart';
import '../widgets/watercolor_background.dart';
import 'splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              const WatercolorBackground(height: 200),
              Positioned(
                top: 48,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white, size: 24),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const SplashScreen()),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B3FA0).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_outline,
                      size: 44,
                      color: Color(0xFF6B3FA0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'You\'re in!',
                    style: TextStyle(
                      color: Color(0xFF6B3FA0),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Welcome to the app',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
