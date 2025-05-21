
import 'hello_plugin_platform_interface.dart';

class HelloPlugin {
  Future<String?> getPlatformVersion() {
    return HelloPluginPlatform.instance.getPlatformVersion();
  }
}
