package com.example.stenography_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import pingm.Pingm

class MainActivity: FlutterActivity() {
    private val CHANNEL = "pingm_plugin"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        try {
            // Initialize the library
            Pingm.touch()
            
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "sum" -> {
                        val a = (call.argument<Int>("a") ?: 0).toLong()
                        val b = (call.argument<Int>("b") ?: 0).toLong()
                        try {
                            val sumResult = Pingm.sum(a, b)
                            result.success(sumResult)
                        } catch (e: Exception) {
                            result.error("NATIVE_EXCEPTION", "Error calling native method", e.message)
                        }
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
        } catch (e: UnsatisfiedLinkError) {
            println("Error loading native library: ${e.message}")
        } catch (e: Exception) {
            println("Error initializing Pingm: ${e.message}")
        }
    }
}