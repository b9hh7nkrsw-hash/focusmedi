package com.focusmedi.app

import android.util.Log

class PermissionManager {
    fun hasAccessibilityPermission(): Boolean {
        // TODO: check accessibility service enabled
        Log.d("PermissionManager", "check accessibility")
        return false
    }

    fun hasUsageAccess(): Boolean {
        // TODO: check usage access
        Log.d("PermissionManager", "check usage access")
        return false
    }
}
