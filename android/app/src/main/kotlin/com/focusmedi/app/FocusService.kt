package com.focusmedi.app

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log

class FocusService : Service() {

    override fun onCreate() {
        super.onCreate()
        Log.d("FocusService", "FocusService created")
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // TODO: start foreground notification and protection
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        super.onDestroy()
    }
}
