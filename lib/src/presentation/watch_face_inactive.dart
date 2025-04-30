import 'dart:async';

import 'package:flutter/material.dart';

class WatchFaceInactive extends StatefulWidget {
  const WatchFaceInactive({super.key});

  @override
  State<WatchFaceInactive> createState() => _WatchFaceInactiveState();
}

class _WatchFaceInactiveState extends State<WatchFaceInactive> {
  String timeString = '00:00:00';

  @override
  void initState() {
    timeString = formatDateTime(DateTime.now().toUtc().add(const Duration(hours: 2, minutes: 30)));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeString = formatDateTime(DateTime.now().toUtc().add(const Duration(hours: 2, minutes: 30)));
      });
    });
    super.initState();
  }

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Center(
        child: Text(timeString, style: const TextStyle(fontSize: 20, color: Colors.grey)),
      ),
    );
  }
}
