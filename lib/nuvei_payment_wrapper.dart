import 'dart:convert';
import 'package:nuvei_payment_wrapper/data/constants.dart';
import 'package:nuvei_payment_wrapper/data/enums.dart';
import 'package:nuvei_payment_wrapper/models/nv_authenticate3d_input.dart';
import 'package:nuvei_payment_wrapper/models/nv_authenticate3d_output.dart';
import 'nuvei_payment_wrapper_platform_interface.dart';

class NuveiPaymentWrapper {
  // Check SDK init success or fail
  static bool isReady = false;

  static Future<void> setup(NVEnvironmentEnum environment) async {
    isReady = await NuveiPaymentWrapperPlatform.instance
            .setup(nvEnvironmentText[environment]) ??
        false;
  }

  static Future<NVAuthenticate3dOutput?> authenticate3d(
    NVAuthenticate3dInput input,
  ) async {
    final Map<String, dynamic> args = input.toJson();
    final String? output =
        await NuveiPaymentWrapperPlatform.instance.authenticate3d(args);

    if (output == null) {
      return null;
    }

    final Map<String, dynamic> outputToJson = jsonDecode(output);
    return NVAuthenticate3dOutput.fromJson(outputToJson);
  }

  static final NuveiPaymentWrapper _instance = NuveiPaymentWrapper._internal();
  factory NuveiPaymentWrapper() {
    return _instance;
  }
  NuveiPaymentWrapper._internal();
}
