import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'app_test_key.dart';

void main() {
  group("NeoPanel Development Test", (){

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("show list", () async {
      /*await driver.tap(tapBottomPopularKey);
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(tapListViewPopularKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(tapListViewPopularKey, 0, 200, Duration(milliseconds: 500));
      await driver.scroll(tapListViewPopularKey, 0, -600, Duration(milliseconds: 500));
      await driver.scroll(tapListViewPopularKey, 0, 800, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapItemPopularKey);*/
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(tapItemFavoriteKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(tapBackButtonKey);
      await Future.delayed(Duration(seconds: 1));
    });



  });
}
