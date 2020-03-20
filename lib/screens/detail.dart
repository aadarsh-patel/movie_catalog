import 'package:flutter/material.dart';
import 'package:movie_catalog/common/theme.dart';
import 'package:movie_catalog/model/data.dart';
import 'package:movie_catalog/widgets/button_group.dart';
import 'package:movie_catalog/widgets/rating.dart';

class DetailScreen extends StatefulWidget {
  final index;
  DetailScreen(this.index);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1b1e44),
        body: SingleChildScrollView(
          child: Tooltip(
            message: 'detail_screen',
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: movies[widget.index].id,
                    child: Image.asset(
                      movies[widget.index].image,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Rating(movies[widget.index].rating),
                        title: Text(
                          movies[widget.index].title,
                          key: ValueKey('movie_title'),
                          style: titleStyle,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10),
                      ButtonGroup(widget.index),
                      SizedBox(height: 10),
                      Text(
                        movies[widget.index].description,
                        style: descriptionStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
