import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hello_plugin_platform_interface.dart';

/// An implementation of [HelloPluginPlatform] that uses method channels.
class MethodChannelHelloPlugin extends HelloPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hello_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final String? version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<double?> getDistance({required double x1, required double y1, required double x2, required double y2}) async {
    final double? distance = await methodChannel.invokeMethod<double>('getDistance', {'x1': x1, 'y1': y1, 'x2': x2, 'y2': y2});
    return distance;
  }

  @override
  Future<int?> getAppVersionCode() async {
    final int? versionCode = await methodChannel.invokeMethod<int>('getAppVersionCode');
    return versionCode;
  }

  @override
  Future<int?> getALMF() async {
    final int? statusCode = await methodChannel.invokeMethod<int>('ALMF');
    return statusCode;
  }
}
