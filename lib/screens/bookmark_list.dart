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
      color: Color(0xFF1b1e44),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Bookmarks',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Calibri',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: ListView.builder(
                itemCount: _bookmarkList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: new Key(_bookmarkList[index].title),
                    background: Container(color: Colors.red,),
                    onDismissed: (direction) {
                      _bookmarkList[index].isBookmarked = false;
                      _bookmarkList.removeAt(index);
                    },
                    child: ListTile(
                      leading: Icon(Icons.movie, color: Colors.white,size: 32),
                      title: Text(_bookmarkList[index].title,key: ValueKey(index),style: TextStyle(color: Colors.white, fontSize: 24),),
                    ),
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
