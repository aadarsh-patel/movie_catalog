<h1><div align="center">Movie Catalog</div><br></h1>
<h3><div align="center">A demo application to learn the testing techniques in Flutter.</div><br></h3>
<div align="center">  
   <a href="https://flutter.dev">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a>   
</div>
<br> 

# Table of contents  

 * [Description](#description)  
 * [Types of automated tests](#There-are-three-types-of-automated-test-in-Flutter) 
   * [Unit test](#1.-unit-test)  
   * [Widget test](#2.-widget-test)  
   * [Integration test](#3.-integration-test)
 * [Golden test](#golden-test)

---

## Description

Movie catalog is an app where user can 

<img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/movie_catalog.gif?raw=true" align = "right" height = "400px">



## There are three types of automated test in Flutter

### 1. Unit test
Unit tests are for testing a single function, method or class. <br/>
To run unit test on this app, run command `flutter test test/unit_test.dart` <br/>
On successful completion of the test you will get an output `00:08 +4: All tests passed!` <br/>
Here, `+4` tells that 4 tests successfully passed.  <br/>
Similarly a `+3 -2` would mean that 3 tests passed and 2 tests failed.  <br/>
Unit tests are very fast.  <br/>


### 2. Widget test
Widget test is to check whether our widget is working as we intended it to be or not. <br/>To run widget test on this app, run command `flutter run test/widget_test.dart` <br/>Widget tests are slower than unit tests but still fast enough that it is hard to see the tap on BookmarkIcon button.

<img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/widget_test.gif?raw=true" align = "right" height = "400px">

### 3. Integration test
Integration tests are to test how individual pieces work together as a whole. <br/>
Integration tests are also used to perform a specific task and record a performance timeline better known as Performance profiling. <br/>
Integration tests work as a pair: first, deploy an instrumented application to a real device or emulator and then “drive” the application from a separate test suite, checking to make sure everything is correct along the way. <br/>
To run integration test on this app, run command `flutter drive --target=test_driver/app.dart` <br/>
Integration tests are the slowest and also the coolest test according to me. <br/>

<img src="https://github.com/aadarsh-patel/movie_catalog/blob/master/gifs/integration_test.gif?raw=true">
