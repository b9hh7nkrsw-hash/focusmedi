import 'package:flutter/material.dart';

class PermissionCenterPage extends StatelessWidget {
  const PermissionCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup Required')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Permissions required to enable Focus protection', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('Accessibility Service'),
              subtitle: Text('Required to detect when blocked apps become active.'),
            ),
            const ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Usage Access'),
              subtitle: Text('Required to reliably detect foreground application.'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification Access (optional)'),
              subtitle: Text('Optional: allow selective notification behavior during Focus.'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
