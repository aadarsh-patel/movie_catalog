# Movie Catalog

A demo application made by me to learn about testing in Flutter.

## There are three types of automated test in Flutter,

### 1. Unit test
Unit tests are for testing a single function, method or class.
To run unit test on this app, run command `flutter test test/unit_test.dart` 
On successful completion of the test you will get an output `00:08 +4: All tests passed!`

I have included 4 tests in unit tests that are as follows,

I/flutter (23896): 00:00 +0: Movie model tests:  Like function should increment likes and undo the changes on calling twice
I/flutter (23896): 00:00 +1: Movie model tests:  Dislike function should increment dislikes and undo the changes on calling twice
I/flutter (23896): 00:00 +2: Movie model tests:  Calling Like function should automatically undo the changes done by Dislike function
I/flutter (23896): 00:00 +3: Movie model tests:  Calling Dislike function should automatically undo the changes done by Like function
