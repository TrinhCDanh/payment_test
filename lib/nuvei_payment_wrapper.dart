import 'nuvei_payment_wrapper_platform_interface.dart';

class NuveiPaymentWrapper {
  Future<String?> getPlatformVersion() {
    return NuveiPaymentWrapperPlatform.instance.getPlatformVersion();
  }

  Future<bool> initializer(Map<String, dynamic> args) {
    return NuveiPaymentWrapperPlatform.instance.initializer(args);
  }

  Future<String?> authenticate3d(Map<String, dynamic> args) {
    return NuveiPaymentWrapperPlatform.instance.authenticate3d(args);
  }
}
