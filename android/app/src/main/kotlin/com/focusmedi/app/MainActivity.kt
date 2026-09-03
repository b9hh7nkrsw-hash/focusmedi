package com.focusmedi.app

import android.os.Bundle
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
                    // TODO: return installed apps list
                    result.success(listOf<Map<String, Any>>())
                }
                else -> result.notImplemented()
            }
        }
    }
}
