import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/notification_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _handleLogout() async {
    await AuthService.clearToken();
    try {
      await FirebaseAuthService.signOut();
    } catch (_) {}
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  Future<void> _showTestNotification() async {
    await NotificationService.showNotification(
      title: 'Test Notification',
      body: 'Notification triggered from Home screen.',
    );
  }

  String _getUserLabel() {
    final firebaseUser = FirebaseAuthService.currentUser;
    if (firebaseUser != null) {
      return firebaseUser.displayName ?? firebaseUser.email ?? 'Google User';
    }
    return 'API User (DummyJSON)';
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuthService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 10 Full – Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            if (firebaseUser?.photoURL != null)
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(firebaseUser!.photoURL!),
                ),
              )
            else
              Center(
                child: Icon(Icons.account_circle,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary),
              ),
            const SizedBox(height: 16),
            Text(
              'Welcome, ${_getUserLabel()}!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (firebaseUser?.email != null) ...[
              const SizedBox(height: 4),
              Text(
                firebaseUser!.email!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.notifications),
              label: const Text('Test Notification'),
              onPressed: _showTestNotification,
            ),
            const SizedBox(height: 8),
            const Text(
              'Auto-login is active. Close the app and reopen — you will skip the login screen.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const Spacer(),
            OutlinedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              onPressed: _handleLogout,
            ),
          ],
        ),
      ),
    );
  }
}
