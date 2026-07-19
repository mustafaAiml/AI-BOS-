import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/ai_bos_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    // Wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      // Go to onboarding/welcome screen
      context.go('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: AiBosLogo(
            size: 120,
            showText: true,
          ),
        ),
      ),
    );
  }
}
