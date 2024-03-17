import 'package:flutter_test/flutter_test.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper_platform_interface.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNuveiPaymentWrapperPlatform
    with MockPlatformInterfaceMixin
    implements NuveiPaymentWrapperPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> authenticate3d(Map<String, dynamic> args) {
    throw UnimplementedError();
  }

  @override
  Future<bool> initializer(Map<String, dynamic> args) {
    throw UnimplementedError();
  }
}

void main() {
  final NuveiPaymentWrapperPlatform initialPlatform =
      NuveiPaymentWrapperPlatform.instance;

  test('$MethodChannelNuveiPaymentWrapper is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNuveiPaymentWrapper>());
  });

  test('getPlatformVersion', () async {
    NuveiPaymentWrapper nuveiPaymentWrapperPlugin = NuveiPaymentWrapper();
    MockNuveiPaymentWrapperPlatform fakePlatform =
        MockNuveiPaymentWrapperPlatform();
    NuveiPaymentWrapperPlatform.instance = fakePlatform;

    expect(await nuveiPaymentWrapperPlugin.getPlatformVersion(), '42');
  });
}
