<h1><div align="center">Movie Catalog</div></h1>
<h3><div align="center">A demo application to learn the testing techniques in Flutter.</div></h3>
<div align="center">  
   <a href="https://flutter.dev">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a>  
  <a href="https://codemagic.io/apps/5e880067bccbec142240bff2/5e880067bccbec142240bff1/latest_build">  
   <img src="https://api.codemagic.io/apps/5e880067bccbec142240bff2/5e880067bccbec142240bff1/status_badge.svg" alt="Platform" />  
  </a>
</div>
<br> 

# Table of contents  

 * [Types of automated tests](#There-are-three-types-of-automated-test-in-Flutter) 
   * [Unit test](#1-unit-test)  
   * [Widget test](#2-widget-test)  
   * [Integration test](#3-integration-test)
 * [Golden test](#golden-test)
 * [Reference](#reference)

---

### There are three types of automated test in Flutter

### 1. Unit test
A unit test tests a single function, method, or class. The goal of a unit test is to verify the correctness of a unit of logic under a variety of conditions.

To run unit test on this app, run command `flutter test test/unit_test.dart`

On successful completion of the test you will get an output `00:08 +4: All tests passed!`
Here, `+4` tells that 4 tests successfully passed.
Similarly a `+3 -2` would mean that 3 tests passed and 2 tests failed.
Unit tests are very fast.

### 2. Widget test
| What is a widget test? | Widget test in action |
|------------------------|-----------------------|
|A widget test (in other UI frameworks referred to as component test) tests a single widget. The goal of a widget test is to verify that the widget’s UI looks and interacts as expected. <br> <br> To run widget test on this app, run command `flutter run test/widget_test.dart`. <br><br> Widget tests are slower than unit tests but still fast enough that it is hard to see the tap on BookmarkIcon button.| <img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/widget_test.gif?raw=true" align = "right" width = "400px"> |

### 3. Integration test
An integration test tests a complete app or a large part of an app. The goal of an integration test is to verify that all the widgets and services being tested work together as expected.

To run integration test on this app, run command `flutter drive --target=test_driver/app.dart`.

Integration tests are also used to perform a specific task and record a performance timeline better known as Performance profiling.
Integration tests work as a pair: first, deploy an instrumented application to a real device or emulator and then “drive” the application from a separate test suite, checking to make sure everything is correct along the way.
Integration tests are the slowest.

**Integration test in action**
<img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/integration_test.gif?raw=true">

### Golden test

| What is a Golden test? | How does a golden file look like? |
|------------------------|-------------|
|A golden test is an IO action that writes its result to a file. To pass the test, this output file should be identical to the corresponding **golden file**, which contains the correct result for the test.<br>Golden test are a special type of widget test.<br> <br>To run golden test on this app, run command `flutter test test/golden_test.dart`.<br><br>The term **golden file** refers to a master image that is considered the true rendering of a given widget, state, application, or other visual representation you have chosen to capture.But these images are not simply a screenshot of the UI, these are special type of images called goldens which are created using command `flutter test --update-goldens test/golden_test.dart`.<br><br>|<table><tr><td><img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/test/goldens/browse.png?raw=true" width = "1300px"></td><td><img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/test/goldens/details.png?raw=true" width = "1300px"></td></tr></table>|


#### Reference

To know more about testing, refer to official Flutter documentation [flutter.dev/docs/testing](https://flutter.dev/docs/testing).

