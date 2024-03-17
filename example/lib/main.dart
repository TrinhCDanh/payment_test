import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  String _platformVersion = 'Unknown';
  final _nuveiPaymentWrapperPlugin = NuveiPaymentWrapper();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    initializer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _nuveiPaymentWrapperPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initializer() async {
    try {
      final Map<String, dynamic> data = {
        "environment": 'STAGING',
        "merchantId": '4099004892638267996',
        "merchantSiteId": '250858',
        "currency": 'USD',
      };
      await _nuveiPaymentWrapperPlugin.initializer(data);
    } on PlatformException {
      print("initializer error");
    }
  }

  Future<void> authenticate3d() async {
    try {
      final Map<String, dynamic> data = {
        "sessionToken": '36e36ee9-714b-4af5-83a5-67b627898634',
        "amount": '151',
        "cardHolderName": "CL-BRW2",
        "cardNumber": "2221008123677736",
        "cvv": "999",
        "monthExpiry": "2",
        "yearExpiry": "2025",
      };
      final String? resultAuthenticate3d =
          await _nuveiPaymentWrapperPlugin.authenticate3d(data);
      final Map<String, dynamic> test = jsonDecode(resultAuthenticate3d!);
      print("=================");
      print(test);
      print("=================");
    } on PlatformException {
      print("initializer error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Text('Running on: $_platformVersion\n'),
            GestureDetector(
              onTap: authenticate3d,
              child: const Text('authenticate3d()'),
            ),
          ],
        ),
      ),
    );
  }
}
