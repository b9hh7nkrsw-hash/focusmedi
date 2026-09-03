import 'package:flutter/material.dart';
import '../../core/platform/platform_channel.dart';

class PermissionCenterPage extends StatefulWidget {
  const PermissionCenterPage({super.key});

  @override
  State<PermissionCenterPage> createState() => _PermissionCenterPageState();
}

class _PermissionCenterPageState extends State<PermissionCenterPage> with WidgetsBindingObserver {
  Map<String, dynamic> _status = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshStatus();
    }
  }

  Future<void> _refreshStatus() async {
    final status = await PlatformChannel.getPermissionStatus();
    if (!mounted) return;
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
            }),

            _row('Usage Access', 'usage', () async {
              await PlatformChannel.openUsageAccessSettings();
            }),

            _row('Notification Access (optional)', 'notifications', () async {
              await PlatformChannel.openNotificationListenerSettings();
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
