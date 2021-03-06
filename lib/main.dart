import 'package:flutter/material.dart';
import 'package:movie_catalog/common/theme.dart';
import 'package:movie_catalog/screens/browse.dart';
import 'package:movie_catalog/screens/bookmark_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myThemeData,
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Catalog',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
                tooltip: 'bookmark_list_button',
                icon: Icon(
                  Icons.collections_bookmark,
                  size: 34,
                ),
                onPressed: () => showBottomSheet(
                      context: context,
                      builder: (BuildContext context) => BookmarkList(),
                    )),
          ),
        ],
      ),
      body: BrowseScreen(),
      endDrawer: BookmarkList(),
    );
  }
}
