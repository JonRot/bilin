import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilin/providers/app_state.dart';
import 'package:bilin/pages/splash_page.dart';

class TeacherDashboardPage extends StatelessWidget {
  const TeacherDashboardPage({super.key});

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
                  'Welcome, ${appState.currentUserData?.name ?? 'Teacher'}!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  appState.teacherProfile?.isApproved == true
                      ? 'Ready to teach and inspire students'
                      : 'Your application is under review',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Profile status
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          appState.teacherProfile?.isApproved == true
                              ? Icons.verified
                              : Icons.pending,
                          size: 32,
                          color: appState.teacherProfile?.isApproved == true
                              ? Colors.green
                              : Colors.orange,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appState.teacherProfile?.isApproved == true
                                    ? 'Profile Approved'
                                    : 'Profile Under Review',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                appState.teacherProfile?.isApproved == true
                                    ? 'You can now receive bookings'
                                    : 'We\'ll notify you once approved',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Stats if approved
                if (appState.teacherProfile?.isApproved == true) ...[
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 32,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${appState.teacherProfile?.rating ?? 0.0}',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                Text(
                                  'Rating',
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
                                  Icons.school,
                                  size: 32,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${appState.teacherProfile?.totalLessons ?? 0}',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                Text(
                                  'Lessons',
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
                        'My Schedule',
                        Icons.calendar_today,
                        () {
                          // TODO: Navigate to schedule
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Earnings',
                        Icons.account_balance_wallet,
                        () {
                          // TODO: Navigate to earnings
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Students',
                        Icons.people,
                        () {
                          // TODO: Navigate to students
                        },
                      ),
                      _buildActionCard(
                        context,
                        'Availability',
                        Icons.access_time,
                        () {
                          // TODO: Navigate to availability
                        },
                      ),
                    ],
                  ),
                ],
                
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
                        'We\'re working on building the complete teacher flow.',
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