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
  Future<double?> getDistance(double x1, double y1, double x2, double y2) async {
    final double? distance = await methodChannel.invokeMethod<double>('getDistance', {'x1': x1, 'y1': y1, 'x2': x2, 'y2': y2});
    return distance;
  }
}
