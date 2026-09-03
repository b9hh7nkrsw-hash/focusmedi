package com.focusmedi.app

import android.accessibilityservice.AccessibilityService
import android.view.accessibility.AccessibilityEvent
import android.util.Log

class FocusAccessibilityService : AccessibilityService() {
    private val TAG = "FocusAccessibilityService"

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        // Minimal implementation: log events. The app's Dart side should bind to any needed service behaviour.
        try {
            if (event != null) {
                Log.d(TAG, "Event received: ${event.eventType} from ${event.packageName}")
            }
        } catch (e: Exception) {
            Log.w(TAG, "onAccessibilityEvent failed", e)
        }
    }

    override fun onInterrupt() {
        // Required override
    }

    override fun onServiceConnected() {
        super.onServiceConnected()
        Log.d(TAG, "Accessibility service connected")
    }
}
