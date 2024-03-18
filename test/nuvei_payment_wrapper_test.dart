import 'package:flutter_test/flutter_test.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper_method_channel.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNuveiPaymentWrapperPlatform
    with MockPlatformInterfaceMixin
    implements NuveiPaymentWrapperPlatform {
  @override
  Future<String?> authenticate3d(Map<String, dynamic> args) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setup(String environment) {
    throw UnimplementedError();
  }
}

void main() {
  final NuveiPaymentWrapperPlatform initialPlatform =
      NuveiPaymentWrapperPlatform.instance;

  test('$MethodChannelNuveiPaymentWrapper is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNuveiPaymentWrapper>());
  });
}
