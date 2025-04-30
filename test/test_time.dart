import 'dart:async';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // Test the DateTime object
    DateTime currentDateAndTime = DateTime.now().toUtc().add(Duration(hours: 2, minutes: 30));
    bool nightMode = currentDateAndTime.hour < 6 || currentDateAndTime.hour > 18;

    group('Test', () {
      test(
        'Test DateTime',
        () {
          expect(currentDateAndTime, isA<DateTime>());
          expect(currentDateAndTime.hour, isNonNegative);
          expect(currentDateAndTime.minute, isNonNegative);
          expect(currentDateAndTime.second, isNonNegative);
        },
      );

      test(
        'Test DateTime',
            () {
          expect(currentDateAndTime, isA<DateTime>());
          expect(currentDateAndTime.hour, (DateTime.now().hour+2)%24);
          expect(currentDateAndTime.minute, (DateTime.now().minute+30)%60);
          expect(currentDateAndTime.second, DateTime.now().second);
        },
      );
    });

    test('night Mode', () {
      expect(nightMode, isA<bool>());
      expect(nightMode, isFalse);
    });



}