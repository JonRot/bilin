import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';
import 'package:bilin/pages/teacher/teacher_dashboard_page.dart';
import 'package:bilin/pages/splash_page.dart';

class TeacherNavigation extends StatefulWidget {
  const TeacherNavigation({super.key});

  @override
  State<TeacherNavigation> createState() => _TeacherNavigationState();
}

class _TeacherNavigationState extends State<TeacherNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const TeacherDashboardPage(),
          _buildComingSoonPage('My Schedule', Icons.calendar_today),
          _buildComingSoonPage('Students', Icons.people),
          _buildComingSoonPage('Earnings', Icons.account_balance_wallet),
          _buildProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildComingSoonPage(String title, IconData icon) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'This feature is coming soon!',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0; // Go back to home
                });
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Profile header
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.school,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  appState.currentUserData?.name ?? 'Teacher',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  appState.currentUserData?.email ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                
                // Teacher status
                if (appState.teacherProfile != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: appState.teacherProfile!.isApproved 
                          ? Colors.green.withValues(alpha: 0.1)
                          : Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          appState.teacherProfile!.isApproved 
                              ? Icons.verified
                              : Icons.pending,
                          size: 16,
                          color: appState.teacherProfile!.isApproved 
                              ? Colors.green
                              : Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          appState.teacherProfile!.isApproved 
                              ? 'Approved'
                              : 'Pending Approval',
                          style: TextStyle(
                            color: appState.teacherProfile!.isApproved 
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                
                const SizedBox(height: 32),
                
                // Profile options
                _buildProfileOption(
                  context,
                  'Edit Profile',
                  Icons.edit,
                  () {
                    // TODO: Navigate to edit profile
                  },
                ),
                _buildProfileOption(
                  context,
                  'Teaching Profile',
                  Icons.school,
                  () {
                    // TODO: Navigate to teaching profile
                  },
                ),
                _buildProfileOption(
                  context,
                  'Availability',
                  Icons.access_time,
                  () {
                    // TODO: Navigate to availability
                  },
                ),
                _buildProfileOption(
                  context,
                  'Service Areas',
                  Icons.location_on,
                  () {
                    // TODO: Navigate to service areas
                  },
                ),
                _buildProfileOption(
                  context,
                  'Payment Settings',
                  Icons.payment,
                  () {
                    // TODO: Navigate to payment settings
                  },
                ),
                _buildProfileOption(
                  context,
                  'Settings',
                  Icons.settings,
                  () {
                    // TODO: Navigate to settings
                  },
                ),
                _buildProfileOption(
                  context,
                  'Help & Support',
                  Icons.help,
                  () {
                    // TODO: Navigate to help
                  },
                ),
                
                const SizedBox(height: 32),
                
                // Logout button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      await appState.signOut();
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const SplashPage()),
                          (route) => false,
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Theme.of(context).colorScheme.error),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}