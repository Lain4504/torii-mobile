package com.miraimagiclab.torii_app

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import com.facebook.FacebookSdk
import com.facebook.appevents.AppEventsLogger

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Initialize Facebook SDK as per documentation
        FacebookSdk.sdkInitialize(applicationContext)
        AppEventsLogger.activateApp(application)
        println("APP_LOG: STARTING_MAIN_ACTIVITY - onCreate")
    }
}
