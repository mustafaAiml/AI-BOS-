import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/shared_widgets.dart';
import '../../core/widgets/ai_bos_logo.dart';

class PersonalSetupScreen extends StatefulWidget {
  const PersonalSetupScreen({super.key});

  @override
  State<PersonalSetupScreen> createState() => _PersonalSetupScreenState();
}

class _PersonalSetupScreenState extends State<PersonalSetupScreen> {
  // Form controllers
  final _nameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _countryController = TextEditingController();
  final _languageController = TextEditingController();
  final _timezoneController = TextEditingController();

  // Selected state tags
  String _selectedRole = 'Student';
  final List<String> _selectedHelps = ['Stay Organized', 'AI Assistant'];

  final List<String> _roles = [
    'Student',
    'Professional',
    'Freelancer',
    'Homemaker',
    'Parent',
    'Creator',
    'Retired',
    'Job Seeker',
    'Business Owner',
    'Other'
  ];

  final List<Map<String, dynamic>> _helpOptions = [
    {'title': 'Stay Organized', 'icon': Icons.calendar_today_outlined},
    {'title': 'Manage Money', 'icon': Icons.account_balance_wallet_outlined},
    {'title': 'Increase Productivity', 'icon': Icons.trending_up_outlined},
    {'title': 'Learning', 'icon': Icons.school_outlined},
    {'title': 'Daily Planning Growth', 'icon': Icons.edit_calendar_outlined},
    {'title': 'Personal Healthy Habits', 'icon': Icons.favorite_border_outlined},
    {'title': 'Document Management', 'icon': Icons.folder_open_outlined},
    {'title': 'Goal Tracking', 'icon': Icons.track_changes_outlined},
    {'title': 'AI Assistant', 'icon': Icons.smart_toy_outlined},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _displayNameController.dispose();
    _dobController.dispose();
    _countryController.dispose();
    _languageController.dispose();
    _timezoneController.dispose();
    super.dispose();
  }

  void _toggleHelp(String title) {
    setState(() {
      if (_selectedHelps.contains(title)) {
        _selectedHelps.remove(title);
      } else {
        _selectedHelps.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9fafb),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1f2937)),
          onPressed: () => context.go('/workspace-select'),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AiBosLogo(size: 32, showText: false),
            SizedBox(width: 8),
            Text(
              'AI BOS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff1f2937),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          Center(
            child: Text(
              'Step 1 of 3',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff6b7280),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              const Text(
                'Create Your Personal Space',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1f2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Let's personalize AI BOS so it works the way you do. Everything you choose can be changed later.",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff6b7280),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Avatar profile picture picker mockup
              GestureDetector(
                onTap: () {
                  // Stub image picker interaction
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Avatar image picker triggered.')),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffe5e7eb),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0d000000),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xff4b5563),
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Add Profile Picture',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4b5563),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Form fields card panel
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x03000000),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField('Full Name', _nameController, 'Mustafa Khan'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFormField('Display Name (Optional)', _displayNameController, 'Mustafa'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildFormField('Date of Birth (Optional)', _dobController, 'DD/MM/YYYY'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormField('Country', _countryController, 'India'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFormField('Language', _languageController, 'English'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFormField('Timezone', _timezoneController, 'IST (UTC+5:30)'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Roles section "Tell us about yourself"
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tell us about yourself',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1f2937),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: _roles.map<Widget>((role) {
                  final isSelected = _selectedRole == role;
                  return ChoiceChip(
                    label: Text(role),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedRole = role;
                        });
                      }
                    },
                    selectedColor: const Color(0xff2563eb),
                    backgroundColor: const Color(0xfff3f4f6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected ? const Color(0xff2563eb) : const Color(0xffe5e7eb),
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : const Color(0xff4b5563),
                    ),
                    showCheckmark: false,
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Help targets grid
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What do you want AI BOS to help you with?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1f2937),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _helpOptions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = _helpOptions[index];
                  final title = item['title'] as String;
                  final isSelected = _selectedHelps.contains(title);
                  return GestureDetector(
                    onTap: () => _toggleHelp(title),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? const Color(0xff2563eb) : const Color(0xffe5e7eb),
                          width: isSelected ? 1.5 : 1,
                        ),
                        boxShadow: [
                          if (isSelected)
                            const BoxShadow(
                              color: Color(0x0a2563eb),
                              blurRadius: 4,
                            ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: isSelected ? const Color(0xff2563eb) : const Color(0xff6b7280),
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? const Color(0xff1f2937) : const Color(0xff4b5563),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Actions
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Continue',
                  onPressed: () => context.go('/preparing'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/preparing'),
                child: const Text(
                  'Skip For Now',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6b7280),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Step 1 of 3',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff9ca3af),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xff4b5563),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 44,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xff9ca3af), fontSize: 13),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xffd1d5db)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xffe5e7eb)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xff2563eb), width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
