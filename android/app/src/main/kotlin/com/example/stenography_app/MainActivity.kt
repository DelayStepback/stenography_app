package com.example.stenography_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import lsb.Lsb

class MainActivity: FlutterActivity() {
    private val CHANNEL = "lsb_plugin"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        try {
            Lsb.touch()

            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "encode" -> {
                        try {
                            val bytes = call.argument<ByteArray>("bytes")
                            val bytes1 = call.argument<ByteArray>("bytes1")
                            if (bytes != null && bytes1 != null) {
                                val encodedBytes = Lsb.encode(bytes, bytes1)
                                result.success(encodedBytes)
                            } else {
                                result.error("INVALID_ARGUMENT", "Missing arguments", null)
                            }
                        } catch (e: Exception) {
                            result.error("ENCODE_ERROR", e.message, null)
                        }
                    }
                    "decode" -> {
                        try {
                            val bytes = call.argument<ByteArray>("bytes")
                            if (bytes != null) {
                                val decodedBytes = Lsb.decode(bytes)
                                result.success(decodedBytes)
                            } else {
                                result.error("INVALID_ARGUMENT", "Missing argument", null)
                            }
                        } catch (e: Exception) {
                            result.error("DECODE_ERROR", e.message, null)
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
            println("Error initializing Lsb: ${e.message}")
        }
    }
}