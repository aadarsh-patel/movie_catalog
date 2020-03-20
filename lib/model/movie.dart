import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String description;
  final String image;
  final double rating;
  int likes;
  int dislikes;

  // Ideally the below attributes should not be defined here as they are user dependent.
  // But as this app is just for demo purpose to showcase the testing tools provided by Flutter.
  // So I am gonna pretend i didn't saw that.
  bool isBookmarked;
  bool isLiked;
  bool isDisliked;

  Movie({
    Key key,
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.rating,
    this.likes = 0,
    this.dislikes = 0,
    this.isLiked = false,
    this.isDisliked = false,
    this.isBookmarked = false,
  });

  void like() {
    if (isLiked) {
      isLiked = false;
      likes -= 1;
    } else {
      if (isDisliked) {
        isDisliked = false;
        dislikes -= 1;
      }
      isLiked = true;
      likes += 1;
    }
  }

  void dislike() {
    if (isDisliked) {
      isDisliked = false;
      dislikes -= 1;
    } else {
      if (isLiked) {
        isLiked = false;
        likes -= 1;
      }
      isDisliked = true;
      dislikes += 1;
    }
  }
}
