import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hello_plugin_method_channel.dart';

abstract class HelloPluginPlatform extends PlatformInterface {
  /// Constructs a HelloPluginPlatform.
  HelloPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static HelloPluginPlatform _instance = MethodChannelHelloPlugin();

  /// The default instance of [HelloPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelHelloPlugin].
  static HelloPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HelloPluginPlatform] when
  /// they register themselves.
  static set instance(HelloPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double?> getDistance({required double x1, required double y1, required double x2, required double y2}) async {
    throw UnimplementedError('getDistance() has not been implemented.');
  }

  Future<int?> getAppVersionCode() async {
    throw UnimplementedError('getAppVersionCode() has not been implemented.');
  }

  Future<int?> getALMF() async {
    throw UnimplementedError('getALMF() has not been implemented.');
  }

  Future<int?> testTDL() async {
    throw UnimplementedError('testTDL() has not been implemented.');
  }
}
