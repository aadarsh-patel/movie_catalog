import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String description;
  final String image;
  final double rating;
  int likes;
  int dislikes;
  bool isBookmarked;

  Movie({
    Key key,
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.rating,
    this.likes = 0,
    this.dislikes = 0,
    this.isBookmarked = false,
  });

  void like() => likes++;
  void dislike() => dislikes++;
}
