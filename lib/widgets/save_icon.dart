import 'package:flutter/material.dart';
import 'package:movie_catalog/model/data.dart';

class SaveIcon extends StatefulWidget {
  final int movieListIndex;
  SaveIcon(this.movieListIndex);
  @override
  _SaveIconState createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  void _changeSave() {
    setState(() {
      if (movies[widget.movieListIndex].isSaved) {
        movies[widget.movieListIndex].isSaved = false;
      } else {
        movies[widget.movieListIndex].isSaved = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        movies[widget.movieListIndex].isSaved ? Icons.bookmark : Icons.bookmark_border,
        size: 32,
        color: Colors.white,
      ),
      onPressed: _changeSave,
    );
  }
}
