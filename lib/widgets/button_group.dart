import 'package:flutter/material.dart';
import 'package:movie_catalog/widgets/bookmark_icon.dart';
import 'package:movie_catalog/model/data.dart';

class ButtonGroup extends StatefulWidget {
  final int index;
  ButtonGroup(this.index);

  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  void _onLikeTap() {
    setState(() {
      if (movies[widget.index].isLiked) {
        movies[widget.index].isLiked = false;
        movies[widget.index].likes -= 1;
      } else {
        if (movies[widget.index].isDisliked) {
          movies[widget.index].isDisliked = false;
          movies[widget.index].dislikes -= 1;
        }
        movies[widget.index].isLiked = true;
        movies[widget.index].likes += 1;
      }
    });
  }

  void _onDislikeTap() {
    setState(() {
      if (movies[widget.index].isDisliked) {
        movies[widget.index].isDisliked = false;
        movies[widget.index].dislikes -= 1;
      } else {
        if (movies[widget.index].isLiked) {
          movies[widget.index].isLiked = false;
          movies[widget.index].likes -= 1;
        }
        movies[widget.index].isDisliked = true;
        movies[widget.index].dislikes += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _likeButtonColor =
        movies[widget.index].isLiked ? Colors.green : Colors.grey;
    Color _dislikeButtonColor =
        movies[widget.index].isDisliked ? Colors.red : Colors.grey;

    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 24),
                    IconButton(
                        icon: Icon(Icons.thumb_up),
                        color: _likeButtonColor,
                        onPressed: _onLikeTap),
                    Text(
                      movies[widget.index].likes.toString(),
                      style: TextStyle(color: _likeButtonColor, fontSize: 20),
                    ),
                    SizedBox(width:44),
                    IconButton(
                        icon: Icon(Icons.thumb_down),
                        color: _dislikeButtonColor,
                        onPressed: _onDislikeTap),
                    Text(
                      movies[widget.index].dislikes.toString(),
                      style: TextStyle(color: _dislikeButtonColor, fontSize: 20),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: LinearBar(widget.index),
                ),
              ],
            ),
          ),
          Flexible(flex: 1, child: BookmarkIcon(widget.index)),
        ],
      ),
    );
  }
}

class LinearBar extends StatelessWidget {
  final int index;
  LinearBar(this.index);

  @override
  Widget build(BuildContext context) {
    int _likes = movies[index].likes;
    int _dislikes = movies[index].dislikes;
    double _likePercentage;
    double _dislikePercentage;
    double _barHeight = 8;
    double _barWidth = MediaQuery.of(context).size.width * 0.48;

    if (_likes == 0 && _dislikes == 0) {
      _likePercentage = 0.5;
      _dislikePercentage = 0.5;
    } else if (_likes == 0 || _dislikes == 0) {
      if (_likes == 0) {
        _likePercentage = 0;
        _dislikePercentage = 1;
      } else {
        _likePercentage = 1;
        _dislikePercentage = 0;
      }
    } else {
      _likePercentage = _likes / (_likes + _dislikes);
      _dislikePercentage = _dislikes / (_likes + _dislikes);
    }

    return Align(
      alignment: Alignment.centerLeft,
          child: Container(
        height: _barHeight,
        width: _barWidth,
        child: Row(
          children: <Widget>[
            Container(width: _likePercentage * _barWidth, color: Colors.green),
            Container(width: _dislikePercentage * _barWidth, color: Colors.red)
          ],
        ),
      ),
    );
  }
}
