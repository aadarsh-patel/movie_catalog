import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String description;
  final String image;
  final double rating;
  int likes;
  int dislikes;
  bool isSaved;

  Movie({
    Key key,
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.rating,
    this.likes = 0,
    this.dislikes = 0,
    this.isSaved = false,
  });

  void like() => likes++;
  void dislike() => dislikes++;
}
