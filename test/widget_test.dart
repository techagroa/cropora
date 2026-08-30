import 'package:flutter_test/flutter_test.dart';

import 'package:cropora/main.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CroporaApp());
  });
}
