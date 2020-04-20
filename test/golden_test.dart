import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_catalog/screens/browse.dart';
import 'package:movie_catalog/screens/detail.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    _loadCalibriFont();
    binding.window.physicalSizeTestValue = Size(540, 960);
    binding.window.devicePixelRatioTestValue = 1;
  });

  testWidgets('Browse screen matches golden file', (WidgetTester tester) async {
    await tester.pumpWidget(MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BrowseScreen(),
      ),
    ));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BrowseScreen),
      matchesGoldenFile('goldens/browse.png'),
    );
  });

  testWidgets('Details screen matches golden file',
      (WidgetTester tester) async {
    await tester.pumpWidget(MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: DetailScreen(0),
      ),
    ));
    await expectLater(
      find.byType(DetailScreen),
      matchesGoldenFile('goldens/details.png'),
    );
  });
}

void _loadCalibriFont() async {
  final fontFileDirectory = Directory('assets/fonts/Calibri');
  final fontLoader = FontLoader('Calibri');
  for (var file in fontFileDirectory.listSync()) {
    if (file.path.endsWith('.ttf')) {
      final fontData = File(file.path)
          .readAsBytes()
          .then((bytes) => ByteData.view(Uint8List.fromList(bytes).buffer));
      fontLoader.addFont(fontData);
    }
  }
  await fontLoader.load();
}
