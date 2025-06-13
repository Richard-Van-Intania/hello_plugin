import 'hello_plugin_platform_interface.dart';

class HelloPlugin {
  Future<String?> getPlatformVersion() async {
    return HelloPluginPlatform.instance.getPlatformVersion();
  }

  Future<double?> getDistance({required double x1, required double y1, required double x2, required double y2}) async {
    return HelloPluginPlatform.instance.getDistance(x1: x1, y1: y1, x2: x2, y2: y2);
  }

  Future<int?> getAppVersionCode() async {
    return HelloPluginPlatform.instance.getAppVersionCode();
  }

  Future<int?> getALMF() async {
    return HelloPluginPlatform.instance.getALMF();
  }

  Future<int?> testTDL() async {
    return HelloPluginPlatform.instance.testTDL();
  }
}
