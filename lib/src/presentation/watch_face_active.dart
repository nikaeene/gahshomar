import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gahshomar/src/presentation/clock/watch_face_painter.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';


class WatchFaceActive extends StatefulWidget {
  const WatchFaceActive({super.key});

  @override
  State<WatchFaceActive> createState() => _WatchFaceActiveState();
}

class _WatchFaceActiveState extends State<WatchFaceActive> {
  DateTime currentDateAndTime = DateTime.now();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentDateAndTime = DateTime.now().toUtc().add(Duration(hours: 2, minutes: 30));
      });
    });
    super.initState();
  }

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  DateFormatter formatPersianDate(Date d) {
    final f = d.formatter;

    return f;
  }

  @override
  Widget build(BuildContext context) {
    final jNow = Jalali.fromDateTime(currentDateAndTime);

    bool nightMode = currentDateAndTime.hour < 6 || currentDateAndTime.hour > 18;

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: nightMode? Colors.black : Colors.white,
      child: Center(
        child: Stack(
          children: [
            Positioned(
                top: screenHeight * 0.25,
                right: screenWidth * 0.05,
                child: Container(
                  padding: EdgeInsets.only(right: 5, left: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: nightMode? Colors.white : Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(2.5)),
                    child: Text(formatPersianDate(jNow).dd.toString().toPersianDigit(), style: TextStyle(color: nightMode? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16)))),

            Positioned(
                top: screenHeight * 0.20,
                left: screenWidth * 0.075,
                child: Text(formatPersianDate(jNow).wN.toString().toPersianDigit(), style: TextStyle(color: nightMode? Colors.white : Colors.black, fontSize: 12))),

            Positioned(
                top: screenHeight * 0.3,
                left: screenWidth * 0.075,
                child: Text(formatPersianDate(jNow).mN.toString().toPersianDigit(), style: TextStyle(color: nightMode? Colors.white : Colors.black, fontSize: 10))),


            SizedBox(
              width: screenWidth * 0.85,
              height: clientHeight * 0.85,

              child: CustomPaint(
                painter: WatchFacePainter(currentDateAndTime, nightMode?  Colors.white : Colors.black),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
