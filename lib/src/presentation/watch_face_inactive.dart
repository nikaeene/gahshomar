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
    timeString = formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeString = formatDateTime(DateTime.now());
      });
    });
    super.initState();
  }

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(timeString),
    );
  }
}
