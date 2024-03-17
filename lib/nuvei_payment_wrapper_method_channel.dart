import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'nuvei_payment_wrapper_platform_interface.dart';

/// An implementation of [NuveiPaymentWrapperPlatform] that uses method channels.
class MethodChannelNuveiPaymentWrapper extends NuveiPaymentWrapperPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nuvei_payment_wrapper');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> initializer(Map<String, dynamic> args) async {
    await methodChannel.invokeMethod<bool>('initializer', args);
    return true;
  }

  @override
  Future<String?> authenticate3d(Map<String, dynamic> args) async {
    final data =
        await methodChannel.invokeMethod<String>('authenticate3d', args);
    return data;
  }
}
