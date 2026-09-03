import 'package:flutter/services.dart';

/// Platform channel API for communicating with Kotlin native layer.
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
}
