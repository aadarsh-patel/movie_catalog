import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Movie Catalog App: ', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Swiping left at browse screen changes movie selection', () async {
      
      final String movieBeforeSwipe = await driver.getText(find.byValueKey('movie_name'));
      expect(await driver.getText(find.byValueKey('movie_name')), movieBeforeSwipe);
      await driver.scroll(find.byValueKey('pageview'), -500, 0, Duration(seconds: 1,milliseconds: 500,));
      Future.delayed(const Duration(seconds: 1));
      expect(await driver.getText(find.byValueKey('movie_name')), isNot(equals(movieBeforeSwipe)));
      
    });

    test('Tapping on movie poster opens detail screen', () async {

      await driver.tap(find.byTooltip('movie_poster'));
      await driver.waitFor(find.byTooltip('detail_screen'));

    });

    test('Tapping on bookmark icon saves it to bookmark list', () async {
      final String movieBookmarked = await driver.getText(find.byValueKey('movie_title'));

      await driver.tap(find.byTooltip('bookmark_button'));
      await Process.run('adb', <String>['shell', 'input', 'keyevent', 'KEYCODE_BACK'], runInShell: true,);
      await driver.tap(find.byTooltip('bookmark_list_button'));
      expect(await driver.getText(find.byValueKey(0)), movieBookmarked);

    });

    test('Checking swipe to dismiss property', () async {
      final movieToDelete = await driver.getText(find.byValueKey(0));
      
      expect(await driver.getText(find.byValueKey(0)), movieToDelete);
      await driver.scroll(find.byValueKey(0), -500, 0, Duration(seconds: 1, milliseconds: 500,));
      
      //expect(await driver.getText(find.byValueKey(0)), isNot(equals(movieToDelete)));

    });


  });
}
