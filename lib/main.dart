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
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
                icon: Icon(
                  Icons.collections_bookmark,
                  size: 30,
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
