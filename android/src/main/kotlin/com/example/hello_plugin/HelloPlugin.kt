package com.example.hello_plugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlin.math.pow
import kotlin.math.sqrt

/** HelloPlugin */
class HelloPlugin : FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "hello_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      "getDistance" -> {
        val x1 = call.argument<Double>("x1")!!
        val y1 = call.argument<Double>("y1")!!
        val x2 = call.argument<Double>("x2")!!
        val y2 = call.argument<Double>("y2")!!
        val distance = distance(x1, y1, x2, y2)
        result.success(distance)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

fun distance(x1: Double, y1: Double, x2: Double, y2: Double): Double {
  return sqrt((x2 - x1).pow(2.0) + (y2 - y1).pow(2.0))
}
