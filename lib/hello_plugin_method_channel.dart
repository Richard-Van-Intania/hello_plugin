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
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
