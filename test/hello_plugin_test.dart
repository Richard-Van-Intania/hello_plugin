import 'package:flutter_test/flutter_test.dart';
import 'package:hello_plugin/hello_plugin.dart';
import 'package:hello_plugin/hello_plugin_platform_interface.dart';
import 'package:hello_plugin/hello_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHelloPluginPlatform with MockPlatformInterfaceMixin implements HelloPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<double?> getDistance(double x1, double y1, double x2, double y2) {
    // TODO: implement getDistance
    throw UnimplementedError();
  }
}

void main() {
  final HelloPluginPlatform initialPlatform = HelloPluginPlatform.instance;

  test('$MethodChannelHelloPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHelloPlugin>());
  });

  test('getPlatformVersion', () async {
    HelloPlugin helloPlugin = HelloPlugin();
    MockHelloPluginPlatform fakePlatform = MockHelloPluginPlatform();
    HelloPluginPlatform.instance = fakePlatform;

    expect(await helloPlugin.getPlatformVersion(), '42');
  });
}
