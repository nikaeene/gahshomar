import 'dart:async';

import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';

class WatchFaceActive extends StatefulWidget {
  const WatchFaceActive({super.key});

  @override
  State<WatchFaceActive> createState() => _WatchFaceActiveState();
}

class _WatchFaceActiveState extends State<WatchFaceActive> {
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

  String formatPersianDate(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d.toPersianDigit()} ${f.mN} ${f.yyyy.toPersianDigit()}';
  }

  @override
  Widget build(BuildContext context) {
    Jalali jNow = Jalali.now().add(hours: 3);

    return Center(
      child: Column(
        children: [
          Text('${jNow.hour.toString().toPersianDigit()}:${jNow.minute.toString().toPersianDigit()}:${jNow.second.toString().toPersianDigit()}'),
          Text(formatPersianDate(jNow)),
        ],
      ),
    );
  }
}
