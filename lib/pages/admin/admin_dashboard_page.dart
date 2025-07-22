import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';
import 'package:bilin/pages/splash_page.dart';
import 'package:bilin/services/data_seeder.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'logout') {
                await context.read<AppState>().signOut();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const SplashPage()),
                    (route) => false,
                  );
                }
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome message
                Text(
                  'Welcome, Admin!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Manage the Bilin tutoring platform',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Stats cards
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    _buildStatCard(
                      context,
                      'Active Parents',
                      '0', // TODO: Load from Firestore
                      Icons.people,
                      Theme.of(context).colorScheme.primary,
                    ),
                    _buildStatCard(
                      context,
                      'Active Teachers',
                      '0', // TODO: Load from Firestore
                      Icons.school,
                      Theme.of(context).colorScheme.secondary,
                    ),
                    _buildStatCard(
                      context,
                      'Today\'s Lessons',
                      '0', // TODO: Load from Firestore
                      Icons.calendar_today,
                      Theme.of(context).colorScheme.tertiary,
                    ),
                    _buildStatCard(
                      context,
                      'Pending Reviews',
                      '0', // TODO: Load from Firestore
                      Icons.pending_actions,
                      Colors.orange,
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Admin actions
                Text(
                  'Admin Actions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildActionCard(
                        context,
                        'Review Teachers',
                        Icons.person_search,
                        () {
                          // TODO: Navigate to teacher applications
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Monitor Lessons',
                        Icons.monitor,
                        () {
                          // TODO: Navigate to lesson monitoring
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Financial Reports',
                        Icons.analytics,
                        () {
                          // TODO: Navigate to financial reports
                        },
                      ),
                      _buildActionCard(
                        context,
                        'User Management',
                        Icons.manage_accounts,
                        () {
                          // TODO: Navigate to user management
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Support Tickets',
                        Icons.support_agent,
                        () {
                          // TODO: Navigate to support tickets
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Platform Settings',
                        Icons.settings,
                        () {
                          // TODO: Navigate to platform settings
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Seed Database',
                        Icons.backup,
                        () => _showSeedDatabaseDialog(context),
                      ),
                    ],
                  ),
                ),
                
                // Coming soon message
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.construction,
                        size: 48,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'More features coming soon!',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'We\'re working on building the complete admin flow.',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSeedDatabaseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Text('Seed Database'),
            ],
          ),
          content: const Text(
            'This will populate the database with sample data including users, teachers, students, lessons, and payments.\n\n'
            'This action should only be performed in development environments.\n\n'
            'Continue?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _seedDatabase(context);
              },
              child: const Text('Seed Database'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _seedDatabase(BuildContext context) async {
    final appState = context.read<AppState>();
    appState.setLoading(true);

    try {
      await DataSeeder.seedDatabase();
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Database seeded successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error seeding database: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      appState.setLoading(false);
    }
  }
}