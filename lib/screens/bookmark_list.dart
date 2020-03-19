import 'package:flutter/material.dart';
import 'package:movie_catalog/model/data.dart';

class BookmarkList extends StatefulWidget {
  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  final _bookmarkList = movies.where((mov) => mov.isBookmarked).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            'Bookmarks',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 200,
              child: ListView.builder(
                itemCount: _bookmarkList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_bookmarkList[index].title),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
