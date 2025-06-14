import 'package:flutter_test/flutter_test.dart';
import 'package:hello_plugin/hello_plugin.dart';
import 'package:hello_plugin/hello_plugin_platform_interface.dart';
import 'package:hello_plugin/hello_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHelloPluginPlatform with MockPlatformInterfaceMixin implements HelloPluginPlatform {
  @override
  Future<int?> getAppVersionCode() {
    // TODO: implement getAppVersionCode
    throw UnimplementedError();
  }

  @override
  Future<double?> getDistance({required double x1, required double y1, required double x2, required double y2}) {
    // TODO: implement getDistance
    throw UnimplementedError();
  }

  @override
  Future<String?> getPlatformVersion() {
    // TODO: implement getPlatformVersion
    throw UnimplementedError();
  }

  @override
  Future<int?> getALMF() {
    // TODO: implement getALMF
    throw UnimplementedError();
  }

  @override
  Future<int?> testTDL() {
    // TODO: implement testTDL
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
