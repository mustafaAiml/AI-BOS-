import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/shared_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => context.go('/workspace-select'),
            child: const Text('Skip'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Onboarding Illustration Placeholder
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f4f6),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circular Orbit Graphic
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffd1d5db), width: 1),
                        ),
                      ),
                      // Central AI Bot Icon
                      Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: Color(0xff2563eb),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.smart_toy,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      // Floating Nodes
                      Positioned(
                        top: 20,
                        left: 60,
                        child: _buildFloatingIcon(Icons.notes, Colors.amber),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 50,
                        child: _buildFloatingIcon(Icons.calendar_today, Colors.green),
                      ),
                      Positioned(
                        top: 40,
                        right: 40,
                        child: _buildFloatingIcon(Icons.notifications, Colors.orange),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 45,
                        child: _buildFloatingIcon(Icons.wallet, Colors.teal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Welcome Headers
              const Text(
                'Welcome to AI BOS',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1f2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Your intelligent workspace for organizing life, managing productivity, planning tasks, tracking expenses and getting AI assistance—all in one place.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6b7280),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Feature Grid/List cards (2x2 Grid)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.45,
                children: [
                  _buildFeatureCard(
                    Icons.smart_toy_outlined,
                    'AI Assistant',
                    'Smart help anytime.',
                  ),
                  _buildFeatureCard(
                    Icons.edit_note_outlined,
                    'Notes',
                    'Capture every idea.',
                  ),
                  _buildFeatureCard(
                    Icons.calendar_today_outlined,
                    'Tasks & Calendar',
                    'Stay organized.',
                  ),
                  _buildFeatureCard(
                    Icons.account_balance_wallet_outlined,
                    'Expenses',
                    'Track your money.',
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Action button with sparkle
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Get Started',
                  showSparkle: true,
                  onPressed: () => context.go('/workspace-select'),
                ),
              ),
              const SizedBox(height: 16),

              // Terms Footer
              const Text(
                'By continuing you agree to our Terms of Service and Privacy Policy.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff9ca3af),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x0d000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 18),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfff3f4f6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xff2563eb),
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff1f2937),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xff6b7280),
            ),
          ),
        ],
      ),
    );
  }
}
