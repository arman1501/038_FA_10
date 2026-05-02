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
                top: 44,
                right: 8,
                child: IconButton(
                  icon:
                      const Icon(Icons.logout, color: Colors.white, size: 24),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SplashScreen()),
                    (route) => false,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline,
                    size: 72, color: Color(0xFF6B3FA0)),
                SizedBox(height: 20),
                Text(
                  "You're in!",
                  style: TextStyle(
                      color: Color(0xFF6B3FA0),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Welcome to the app',
                    style:
                        TextStyle(color: Color(0xFF757575), fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
