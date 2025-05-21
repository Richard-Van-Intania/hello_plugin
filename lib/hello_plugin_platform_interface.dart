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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
