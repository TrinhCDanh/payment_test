import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper_method_channel.dart';

void main() {
  MethodChannelNuveiPaymentWrapper platform =
      MethodChannelNuveiPaymentWrapper();
  const MethodChannel channel = MethodChannel('nuvei_payment_wrapper');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
