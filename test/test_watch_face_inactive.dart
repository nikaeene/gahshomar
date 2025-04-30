import 'package:flutter_test/flutter_test.dart';
import 'package:gahshomar/src/presentation/watch_face_inactive.dart';

main() {
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }


  // Test the WatchFaceInactive widget
  group('WatchFaceInactive', () {
    testWidgets('displays the correct time string', (WidgetTester tester) async {
      // Build the WatchFaceInactive widget
      await tester.pumpWidget(const WatchFaceInactive());

      // Verify that the initial time string is displayed
      expect(find.text(formatDateTime(DateTime.now().toUtc().add(const Duration(hours: 2, minutes: 30)))), findsOneWidget);

      // Wait for 1 second to allow the timer to update the time string
      await tester.pump(const Duration(seconds: 1));

      // Verify that the updated time string is displayed
      expect(find.textContaining(formatDateTime(DateTime.now().toUtc().add(const Duration(hours: 2, minutes: 30)))), findsOneWidget);
    });
  });
}
