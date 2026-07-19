import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/shared_widgets.dart';
import '../../core/widgets/ai_bos_logo.dart';

class WorkspaceSelectScreen extends StatelessWidget {
  const WorkspaceSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              // App Logo at the Top
              const Center(
                child: AiBosLogo(size: 60, showText: false),
              ),
              const SizedBox(height: 8),
              const Text(
                'AI BOS',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
              ),
              const Text(
                'One AI. Every Workspace.',
                style: TextStyle(fontSize: 12, color: Color(0xff6b7280), fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 28),

              // Title and Subtitle
              const Text(
                'Choose Your Workspace',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Select the workspace that best matches your needs. You can always add more later.',
                style: TextStyle(fontSize: 14, color: Color(0xff6b7280), height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),

              // 1. Personal Space Card (Active)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xff2563eb), width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x05000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row: Title + Illustration Placeholder on right
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Personal Space',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1f2937),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Organize your daily life with AI',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff4b5563),
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Tag Wrap
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: [
                                  _buildTag('Notes'),
                                  _buildTag('Tasks'),
                                  _buildTag('Calendar'),
                                  _buildTag('Expenses'),
                                  _buildTag('Budget'),
                                  _buildTag('AI Chat'),
                                  _buildTag('Documents'),
                                  _buildTag('Reminders'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Mini Illustration Placeholder
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffeff6ff),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.laptop_chromebook,
                            color: Color(0xff2563eb),
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Continue button inside Personal Space
                    SizedBox(
                      width: 140,
                      height: 48,
                      child: AppButton(
                        text: 'Continue',
                        onPressed: () => context.go('/personal-setup'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 2. Commerce Suite Card (Coming Soon)
              _buildComingSoonCard(
                'Commerce Suite',
                'Smart tools for stores, retail, restaurants, pharmacies and commerce',
                Icons.storefront_outlined,
              ),
              const SizedBox(height: 16),

              // 3. Enterprise Suite Card (Coming Soon)
              _buildComingSoonCard(
                'Enterprise Suite',
                'Manage organizations, teams, employees and operations',
                Icons.business_outlined,
              ),
              const SizedBox(height: 28),

              // Footer text
              const Text(
                'More workspaces will be available in future updates.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff9ca3af),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xfff3f4f6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Color(0xff4b5563),
        ),
      ),
    );
  }

  Widget _buildComingSoonCard(String title, String subtitle, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xfff9fafb),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xffe5e7eb), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xfff3f4f6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xff9ca3af), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9ca3af),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xffe5e7eb),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6b7280),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff9ca3af),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.lock_outline,
            color: Color(0xff9ca3af),
            size: 20,
          ),
        ],
      ),
    );
  }
}
