import 'package:flutter/material.dart';
import 'package:movie_catalog/model/data.dart';

class BookmarkList extends StatefulWidget {
  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 260,
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          if(movies[index].isSaved){
            return ListTile(leading: Text(movies[index].title),);
          }
        },
      ),
    );
  }
}
