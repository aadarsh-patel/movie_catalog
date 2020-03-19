import 'package:flutter/material.dart';
import 'package:movie_catalog/model/data.dart';

class BookmarkIcon extends StatefulWidget {
  final int movieListIndex;
  BookmarkIcon(this.movieListIndex);
  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  void _changeBookmark() {
    setState(() {
      if (movies[widget.movieListIndex].isBookmarked) {
        movies[widget.movieListIndex].isBookmarked = false;
      } else {
        movies[widget.movieListIndex].isBookmarked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        movies[widget.movieListIndex].isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        size: 32,
        color: Colors.white,
      ),
      onPressed: _changeBookmark,
    );
  }
}
