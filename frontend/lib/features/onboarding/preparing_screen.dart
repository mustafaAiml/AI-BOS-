import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreparingScreen extends StatefulWidget {
  const PreparingScreen({super.key});

  @override
  State<PreparingScreen> createState() => _PreparingScreenState();
}

class _PreparingScreenState extends State<PreparingScreen> with SingleTickerProviderStateMixin {
  int _currentStep = 0;
  late AnimationController _rotationController;

  final List<String> _steps = [
    'Creating Workspace',
    'Personalizing Experience',
    'Preparing AI Assistant',
    'Finalizing Setup',
  ];

  @override
  void initState() {
    super.initState();

    // Rotational orbit animation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _runSetupSteps();
  }

  void _runSetupSteps() async {
    for (int i = 0; i < _steps.length; i++) {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (mounted) {
        setState(() {
          _currentStep = i + 1;
        });
      }
    }
    // Final short delay before navigating to dashboard
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      context.go('/dashboard');
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Animated Orbital Graphic
              Center(
                child: SizedBox(
                  width: 220,
                  height: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Rotating Outer Orbits
                      AnimatedBuilder(
                        animation: _rotationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationController.value * 2.0 * 3.14159,
                            child: Stack(
                              children: [
                                // Circular Orbit Lines
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xffe5e7eb),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xfff3f4f6),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                // Floating Orbit Nodes
                                Positioned(
                                  top: 10,
                                  left: 90,
                                  child: _buildOrbNode(Icons.notes, Colors.amber),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 90,
                                  child: _buildOrbNode(Icons.calendar_today, Colors.green),
                                ),
                                Positioned(
                                  right: 15,
                                  top: 90,
                                  child: _buildOrbNode(Icons.notifications, Colors.orange),
                                ),
                                Positioned(
                                  left: 15,
                                  bottom: 90,
                                  child: _buildOrbNode(Icons.wallet, Colors.teal),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // Central Badge
                      Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 15,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xff2563eb),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'AI',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'AI BOS',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1f2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Headings
              const Text(
                'Preparing Your\nPersonal Space...',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1f2937),
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'AI BOS is organizing your workspace, optimizing your experience and getting everything ready for you. This usually takes only a few seconds.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff4b5563),
                  height: 1.45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Checklist box
              Container(
                width: 280,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: List.generate(_steps.length, (index) {
                    final isDone = _currentStep > index;
                    final isCurrent = _currentStep == index;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDone ? const Color(0xff2563eb) : Colors.transparent,
                              border: Border.all(
                                color: isDone ? const Color(0xff2563eb) : const Color(0xffd1d5db),
                                width: 2,
                              ),
                            ),
                            child: isDone
                                ? const Icon(
                                    Icons.check,
                                    size: 12,
                                    color: Colors.white,
                                  )
                                : isCurrent
                                    ? const Center(
                                        child: SizedBox(
                                          width: 8,
                                          height: 8,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(Color(0xff2563eb)),
                                          ),
                                        ),
                                      )
                                    : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              _steps[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isDone ? FontWeight.w600 : FontWeight.w500,
                                color: isDone
                                    ? const Color(0xff1f2937)
                                    : isCurrent
                                        ? const Color(0xff2563eb)
                                        : const Color(0xff9ca3af),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              const Spacer(),
              const Text(
                'Your intelligent workspace is almost ready.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff9ca3af),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrbNode(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 4,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
