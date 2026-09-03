import 'package:flutter/services.dart';

class PlatformChannel {
  static const _channel = MethodChannel('com.focusmedi.app/platform');

  static Future<Map<String, dynamic>?> startProtection(int modeId) async {
    final res = await _channel.invokeMapMethod<String, dynamic>('startProtection', {'modeId': modeId});
    return res?.cast<String, dynamic>();
  }

  static Future<Map<String, dynamic>?> stopProtection() async {
    final res = await _channel.invokeMapMethod<String, dynamic>('stopProtection');
    return res?.cast<String, dynamic>();
  }

  static Future<List<dynamic>?> getInstalledApps() async {
    final res = await _channel.invokeMethod<List<dynamic>>('getInstalledApps');
    return res;
  }

  static Future<Map<String, dynamic>?> getPermissionStatus() async {
    final res = await _channel.invokeMapMethod<String, dynamic>('getPermissionStatus');
    return res?.cast<String, dynamic>();
  }

  static Future<void> openAccessibilitySettings() async {
    await _channel.invokeMethod('openAccessibilitySettings');
  }

  static Future<void> openUsageAccessSettings() async {
    await _channel.invokeMethod('openUsageAccessSettings');
  }

  static Future<void> openNotificationListenerSettings() async {
    await _channel.invokeMethod('openNotificationListenerSettings');
  }

  static Future<void> openDoNotDisturbSettings() async {
    await _channel.invokeMethod('openDoNotDisturbSettings');
  }

  static Future<void> openAppDetails({String? package}) async {
    await _channel.invokeMethod('openAppDetails', {'package': package});
  }

  static Future<void> openBatteryOptimizationSettings() async {
    await _channel.invokeMethod('openBatteryOptimizationSettings');
  }
}
