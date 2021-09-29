import 'dart:async';

import 'package:flurry_event/flurry.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await FlurryEvent.initialize(
        androidKey: "XQRP9F8D9WMW9KTMSSKC3",
        iosKey: "7F4D3BQBCD5YRSF42N47",
        enableLog: true);
    await FlurryEvent.setUserId("userId");
    await FlurryEvent.logEvent("eventName");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A Flurry plugin example app'),
        ),
        body: Center(
          child: Text(
              'Should log event. Please close the app and wait a few seconds for events to be sent.'),
        ),
      ),
    );
  }
}
