import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _notificationSent = false;

  @override
  void initState() {
    super.initState();
    NotificationService.requestPermission();
  }

  Future<void> _showNotification() async {
    await NotificationService.showNotification(
      title: 'Hello from Lab 10.5!',
      body: 'This is a local notification triggered manually.',
    );
    setState(() => _notificationSent = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 10.5 – Notifications'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _notificationSent
                  ? Icons.notifications_active
                  : Icons.notifications_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            const Text(
              'Local Notifications Demo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the button below to trigger a system notification.\n'
              'On Android 13+, you will be prompted to grant permission on first launch.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.notifications),
                label: const Text('Show Notification',
                    style: TextStyle(fontSize: 16)),
                onPressed: _showNotification,
              ),
            ),
            if (_notificationSent) ...[
              const SizedBox(height: 16),
              const Text(
                'Notification sent! Check your notification tray.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
