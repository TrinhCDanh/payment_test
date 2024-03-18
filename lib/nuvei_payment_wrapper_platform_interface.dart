import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nuvei_payment_wrapper_method_channel.dart';

abstract class NuveiPaymentWrapperPlatform extends PlatformInterface {
  /// Constructs a NuveiPaymentWrapperPlatform.
  NuveiPaymentWrapperPlatform() : super(token: _token);

  static final Object _token = Object();

  static NuveiPaymentWrapperPlatform _instance =
      MethodChannelNuveiPaymentWrapper();

  /// The default instance of [NuveiPaymentWrapperPlatform] to use.
  ///
  /// Defaults to [MethodChannelNuveiPaymentWrapper].
  static NuveiPaymentWrapperPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NuveiPaymentWrapperPlatform] when
  /// they register themselves.
  static set instance(NuveiPaymentWrapperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> setup(String environment) {
    throw UnimplementedError('setup() has not been implemented.');
  }

  Future<String?> authenticate3d(Map<String, dynamic> args) {
    throw UnimplementedError('authenticate3d() has not been implemented.');
  }
}
