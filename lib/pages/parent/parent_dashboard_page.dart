import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';
import 'package:bilin/pages/splash_page.dart';

class ParentDashboardPage extends StatelessWidget {
  const ParentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
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
                  'Welcome, ${appState.currentUserData?.name ?? 'Parent'}!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Manage your children\'s language learning journey',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Quick stats cards
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.child_care,
                                size: 32,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${appState.userStudents.length}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                'Children',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 32,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '0', // TODO: Load from Firestore
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                'Upcoming',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
                
                // Quick actions
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildActionCard(
                      context,
                      'Find Teachers',
                      Icons.search,
                      () {
                        // TODO: Navigate to browse teachers
                      },
                    ),
                    _buildActionCard(
                      context,
                      'Add Child',
                      Icons.person_add,
                      () {
                        // TODO: Navigate to add child
                      },
                    ),
                    _buildActionCard(
                      context,
                      'View Lessons',
                      Icons.calendar_today,
                      () {
                        // TODO: Navigate to lessons
                      },
                    ),
                    _buildActionCard(
                      context,
                      'Payments',
                      Icons.payment,
                      () {
                        // TODO: Navigate to payments
                      },
                    ),
                  ],
                ),
                
                const Spacer(),
                
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
                        'We\'re working on building the complete parent flow.',
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
}