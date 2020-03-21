# Movie Catalog

A demo application made by me to learn about testing in Flutter. <br/>

## There are three types of automated test in Flutter,

### 1. Unit test
Unit tests are for testing a single function, method or class. <br/>
To run unit test on this app, run command `flutter test test/unit_test.dart` <br/>
On successful completion of the test you will get an output `00:08 +4: All tests passed!` <br/>
Here, `+4` tells that 4 tests successfully passed.  <br/>
Similarly a `+3 -2` would mean that 3 tests passed and 2 tests failed.  <br/>
Unit tests are very fast.  <br/>


### 2. Widget test
Widget tests are for..... testing the widgets. <br/>
It is to check whether our widget is working as we intended it to be or not. <br/>
To run widget test on this app, run command `flutter run test/widget_test.dart` <br/>
Widget tests are slower than unit tests but still fast enough that it is hard to see the tap on BookmarkIcon button.

![](https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/widget_test.gif)

### 3. Integration test
Integration tests are to test how individual pieces work together as a whole. <br/>
Integration tests are also used to perform a specific task and record a performance timeline better known as Performance profiling. <br/>
Integration tests work as a pair: first, deploy an instrumented application to a real device or emulator and then “drive” the application from a separate test suite, checking to make sure everything is correct along the way. <br/>
To run integration test on this app, run command `flutter drive --target=test_driver/app.dart` <br/>
Integration tests are the slowest and also the coolest test according to me. <br/>

![](https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/integration_test.gif)
