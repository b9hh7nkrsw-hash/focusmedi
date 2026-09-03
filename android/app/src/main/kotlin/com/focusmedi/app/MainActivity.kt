package com.focusmedi.app

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.Settings
import android.app.AppOpsManager
import android.content.Context
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.focusmedi.app/platform"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startProtection" -> {
                    val modeId = (call.argument<Number>("modeId") ?: 0).toInt()
                    // TODO: start protection via FocusService
                    result.success(mapOf("status" to "ok"))
                }
                "stopProtection" -> {
                    // TODO: stop protection
                    result.success(mapOf("status" to "ok"))
                }
                "getInstalledApps" -> {
                    val pm = packageManager
                    val apps = pm.getInstalledApplications(0)
                        .filter { pm.getLaunchIntentForPackage(it.packageName) != null }
                        .map { mapOf("packageName" to it.packageName, "label" to (pm.getApplicationLabel(it).toString())) }
                    result.success(apps)
                }
                "getPermissionStatus" -> {
                    val status = mapOf(
                        "accessibility" to isAccessibilityEnabled(),
                        "usage" to hasUsageAccess(),
                        "notifications" to hasNotificationPermission(),
                        "dnd" to hasDndAccess()
                    )
                    result.success(status)
                }
                "openAccessibilitySettings" -> {
                    val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                "openUsageAccessSettings" -> {
                    val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                "openNotificationListenerSettings" -> {
                    val intent = Intent("android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS")
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                "openDoNotDisturbSettings" -> {
                    val intent = Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS)
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                "openAppDetails" -> {
                    val pkg = call.argument<String>("package") ?: packageName
                    val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:$pkg"))
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                "openBatteryOptimizationSettings" -> {
                    val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun isAccessibilityEnabled(): Boolean {
        try {
            val svc = Settings.Secure.getString(contentResolver, Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES)
            if (svc != null && svc.contains(packageName)) return true
        } catch (e: Exception) {
            Log.w("MainActivity", "isAccessibilityEnabled check failed", e)
        }
        return false
    }

    private fun hasUsageAccess(): Boolean {
        try {
            val appOps = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
            val mode = appOps.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), packageName)
            return mode == AppOpsManager.MODE_ALLOWED
        } catch (e: Exception) {
            Log.w("MainActivity", "hasUsageAccess check failed", e)
        }
        return false
    }

    private fun hasNotificationPermission(): Boolean {
        // For Android 13+, POST_NOTIFICATIONS is a runtime permission. We can check it here.
        return checkSelfPermission(android.Manifest.permission.POST_NOTIFICATIONS) == android.content.pm.PackageManager.PERMISSION_GRANTED
    }

    private fun hasDndAccess(): Boolean {
        try {
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as android.app.NotificationManager
            return notificationManager.isNotificationPolicyAccessGranted
        } catch (e: Exception) {
            Log.w("MainActivity", "hasDndAccess check failed", e)
        }
        return false
    }
}
