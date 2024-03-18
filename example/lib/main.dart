import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:nuvei_payment_wrapper/data/enums.dart';
import 'package:nuvei_payment_wrapper/models/nv_authenticate3d_input.dart';
import 'package:nuvei_payment_wrapper/models/nv_authenticate3d_output.dart';
import 'package:nuvei_payment_wrapper/nuvei_payment_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializer();
  }

  Future<void> initializer() async {
    try {
      await NuveiPaymentWrapper.setup(NVEnvironmentEnum.staging);
    } on PlatformException {
      print("initializer error");
    }
  }

  Future<void> authenticate3d() async {
    try {
      final NVAuthenticate3dInput input = NVAuthenticate3dInput(
        sessionToken: "8c41e2f5-026b-41f3-a3b8-b549c8a10d01",
        merchantId: '4099004892638267996',
        merchantSiteId: '250858',
        currency: 'USD',
        amount: "151",
        cardHolderName: "CL-BRW2",
        cardNumber: "2221008123677736",
        cvv: "999",
        monthExpiry: "2",
        yearExpiry: "2025",
      );
      final NVAuthenticate3dOutput? resultAuthenticate3d =
          await NuveiPaymentWrapper.authenticate3d(input);
      print("=================");
      print(resultAuthenticate3d);
      print("=================");
    } on PlatformException {
      print("authenticate3d error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nuvei Payment example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: authenticate3d,
                child: Container(
                  color: Colors.amber,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: const Text('authenticate3d()'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
