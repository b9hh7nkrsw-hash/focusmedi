import 'package:flutter/material.dart';
import '../../core/platform/platform_channel.dart';

class PermissionCenterPage extends StatefulWidget {
  const PermissionCenterPage({super.key});

  @override
  State<PermissionCenterPage> createState() => _PermissionCenterPageState();
}

class _PermissionCenterPageState extends State<PermissionCenterPage> {
  Map<String, dynamic> _status = {};

  @override
  void initState() {
    super.initState();
    _refreshStatus();
  }

  Future<void> _refreshStatus() async {
    final status = await PlatformChannel.getPermissionStatus();
    setState(() {
      _status = status ?? {};
    });
  }

  Widget _row(String title, String key, VoidCallback onOpen) {
    final granted = _status[key] == true;
    return ListTile(
      leading: Icon(granted ? Icons.check_circle : Icons.warning, color: granted ? Colors.green : Colors.orange),
      title: Text(title),
      subtitle: Text(granted ? 'Granted' : 'Required'),
      trailing: ElevatedButton(onPressed: onOpen, child: Text(granted ? 'Open' : 'Enable')),
    );
  }

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
            _row('Accessibility Service', 'accessibility', () async {
              await PlatformChannel.openAccessibilitySettings();
              await Future.delayed(const Duration(milliseconds: 500));
              _refreshStatus();
            }),

            _row('Usage Access', 'usage', () async {
              await PlatformChannel.openUsageAccessSettings();
              await Future.delayed(const Duration(milliseconds: 500));
              _refreshStatus();
            }),

            _row('Notification Access (optional)', 'notifications', () async {
              await PlatformChannel.openNotificationListenerSettings();
              await Future.delayed(const Duration(milliseconds: 500));
              _refreshStatus();
            }),

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
