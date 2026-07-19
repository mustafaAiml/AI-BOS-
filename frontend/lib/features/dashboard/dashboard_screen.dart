import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  // Handles switching tab contents
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildAiAssistantTab();
      case 2:
        return _buildWorkspacesTab();
      case 3:
        return _buildNotificationsTab();
      case 4:
        return _buildProfileTab();
      default:
        return _buildHomeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0x269e9e9e),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff2563eb),
          unselectedItemColor: const Color(0xff9ca3af),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy_outlined),
              activeIcon: Icon(Icons.smart_toy),
              label: 'AI Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspaces_outline),
              activeIcon: Icon(Icons.workspaces),
              label: 'Workspaces',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              activeIcon: Icon(Icons.notifications),
              label: 'Alerts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  // --- TAB 1: Home Dashboard ---
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting & Profile Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(fontSize: 14, color: Color(0xff6b7280), fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Mustafa Khan',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
                  ),
                ],
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xffeff6ff),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff2563eb), width: 1.5),
                ),
                child: const Center(
                  child: Text(
                    'MK',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff2563eb)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Search Bar & AI Assist Quick Button
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xfff3f4f6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Color(0xff6b7280), size: 20),
                      SizedBox(width: 12),
                      Text(
                        'Search files, notes, tasks...',
                        style: TextStyle(color: Color(0xff9ca3af), fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 1; // Direct trigger to AI tab
                  });
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xff2563eb),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Today's Productivity summary
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xffeff6ff),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Workspace Summary',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff1e3a8a)),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'You have completed 3 of your 5 tasks for today. Great job!',
                        style: TextStyle(fontSize: 13, color: Color(0xff1d4ed8), height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 52,
                  height: 52,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '60%',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff2563eb)),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Today's Overview grid header
          const Text(
            "Today's Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
          ),
          const SizedBox(height: 12),

          // Feature Grid Cards
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.25,
            children: [
              _buildDashboardCard(Icons.edit_note, 'Notes', '4 notes added', Colors.amber),
              _buildDashboardCard(Icons.task_alt, 'Tasks', '2 tasks left', Colors.green),
              _buildDashboardCard(Icons.calendar_month, 'Calendar', '1 event today', Colors.purple),
              _buildDashboardCard(Icons.wallet, 'Expenses', 'INR 1,200 today', Colors.teal),
            ],
          ),
          const SizedBox(height: 24),

          // Recent Activity Section
          const Text(
            "Recent Activity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffe5e7eb)),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                _buildActivityItem('Note added', 'Shopping List updated', '10 mins ago'),
                _buildDivider(),
                _buildActivityItem('Task completed', 'Fix FastAPI database connection', '1 hr ago'),
                _buildDivider(),
                _buildActivityItem('Expense logged', 'Lunch at restaurant - INR 350', '3 hrs ago'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(IconData icon, String title, String subtitle, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xffe5e7eb)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Color(0xff6b7280)),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String type, String title, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff9ca3af))),
              const SizedBox(height: 2),
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff1f2937))),
            ],
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Color(0xff6b7280))),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Color(0xffe5e7eb), height: 1),
    );
  }

  // --- TAB 2: AI Assistant ---
  Widget _buildAiAssistantTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xff2563eb), size: 24),
              SizedBox(width: 12),
              Text(
                'AI Assistant',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Ask me to summarize notes, schedule tasks, or query expenses.',
            style: TextStyle(fontSize: 12, color: Color(0xff6b7280)),
          ),
          const SizedBox(height: 20),

          // Message history list area
          Expanded(
            child: ListView(
              children: [
                _buildChatMessage(
                  'Hello Mustafa! I am your AI assistant. How can I help you manage your Personal Space today?',
                  false,
                ),
                _buildChatMessage(
                  'Can you summarize my expenses for today?',
                  true,
                ),
                _buildChatMessage(
                  'You logged 1 expense today: Lunch at restaurant (INR 350). Your total budget usage is 10% of your monthly limits.',
                  false,
                ),
              ],
            ),
          ),

          // Message input bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xfff3f4f6),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  color: Color(0xff2563eb),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildChatMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xff2563eb) : const Color(0xfff3f4f6),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
        ),
        constraints: const BoxConstraints(maxWidth: 280),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : const Color(0xff1f2937),
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  // --- TAB 3: Workspaces ---
  Widget _buildWorkspacesTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Workspaces',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
          ),
          const SizedBox(height: 16),
          // Personal Workspace Item
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffeff6ff),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xff2563eb)),
            ),
            child: const Row(
              children: [
                Icon(Icons.person, color: Color(0xff2563eb)),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Personal Space', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff1f2937))),
                    Text('Active Workspace', style: TextStyle(fontSize: 12, color: Color(0xff6b7280))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Locked Suites list
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xfff9fafb),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffe5e7eb)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.storefront, color: Color(0xff9ca3af)),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Commerce Suite', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff9ca3af))),
                        Text('Coming Soon', style: TextStyle(fontSize: 12, color: Color(0xff9ca3af))),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.lock_outline, color: Color(0xff9ca3af)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- TAB 4: Alerts / Notifications ---
  Widget _buildNotificationsTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alerts & Notifications',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildNotificationItem('System Update', 'Personal Workspace setup was successful!', '10 mins ago'),
                _buildNotificationItem('Reminder', 'Review task: Complete database documentation', '1 hr ago'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String desc, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfff9fafb),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffe5e7eb)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff1f2937))),
              Text(time, style: const TextStyle(fontSize: 11, color: Color(0xff9ca3af))),
            ],
          ),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 13, color: Color(0xff4b5563))),
        ],
      ),
    );
  }

  // --- TAB 5: Profile & Settings ---
  Widget _buildProfileTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1f2937)),
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xffeff6ff),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('MK', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff2563eb))),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Mustafa Khan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1f2937))),
                const Text('mustafa.khan@example.com', style: TextStyle(fontSize: 13, color: Color(0xff6b7280))),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(color: Color(0xffe5e7eb)),
          const SizedBox(height: 16),
          _buildProfileLink(Icons.settings_outlined, 'General Settings'),
          _buildProfileLink(Icons.security_outlined, 'Security & Privacy'),
          _buildProfileLink(Icons.help_outline, 'Help & Feedback'),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Return to onboarding flow
                context.go('/welcome');
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Colors.red, width: 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileLink(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xff4b5563), size: 22),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff1f2937))),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Color(0xff9ca3af)),
        ],
      ),
    );
  }
}
