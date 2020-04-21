import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:movie_catalog/screens/browse.dart';
import 'package:movie_catalog/screens/detail.dart';

void main() async {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  await _loadFonts();

  setUp(() {
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

Future<void> _loadFonts() async {
  //https://github.com/flutter/flutter/issues/20907

  final testDirectory = p.join(
    Directory.current.path,
    Directory.current.path.endsWith('test') ? '' : 'test',
  );

  final fontData = File('$testDirectory/test_fonts/Calibri/Calibri-Regular.ttf')
      .readAsBytes()
      .then((bytes) => ByteData.view(Uint8List.fromList(bytes).buffer));
  final fontData2 = File('$testDirectory/test_fonts/Calibri/Calibri-Bold.ttf')
      .readAsBytes()
      .then((bytes) => ByteData.view(Uint8List.fromList(bytes).buffer));
  final fontLoader = FontLoader('Calibri')
    ..addFont(fontData)
    ..addFont(fontData2);
  await fontLoader.load();
}
