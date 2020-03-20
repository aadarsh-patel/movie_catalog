import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_catalog/widgets/bookmark_icon.dart';

void main() {
  testWidgets('Bookmark Icon widget tests: ', (WidgetTester tester) async {

    // Build our DummyApp for BookmarkIcon widget test.
    await tester.pumpWidget(DummyApp());
    await tester.pumpAndSettle();

    expect(find.widgetWithIcon(IconButton, Icons.bookmark_border), findsOneWidget);
    expect(find.widgetWithIcon(IconButton, Icons.bookmark), findsNothing);

    await tester.tap(find.byTooltip('bookmark_button'));
    await tester.pumpAndSettle();

    expect(find.widgetWithIcon(IconButton, Icons.bookmark_border), findsNothing);
    expect(find.widgetWithIcon(IconButton, Icons.bookmark), findsOneWidget);
  });
}

class DummyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BookmarkIcon(1),
      ),
    );
  }
}
