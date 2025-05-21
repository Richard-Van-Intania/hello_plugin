import 'hello_plugin_platform_interface.dart';

class HelloPlugin {
  Future<String?> getPlatformVersion() async {
    return HelloPluginPlatform.instance.getPlatformVersion();
  }

  Future<double?> getDistance(double x1, double y1, double x2, double y2) async {
    return HelloPluginPlatform.instance.getDistance(x1, y1, x2, y2);
  }
}
