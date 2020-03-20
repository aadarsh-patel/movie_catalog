import 'package:flutter_test/flutter_test.dart';
import 'package:movie_catalog/model/movie.dart';

void main(){

  group('Movie model tests: ', (){
    
    test('Like function should increment likes and undo the changes on calling twice',(){

      final movie = Movie(id: 1, title: 'title', description: 'description', image: 'image', rating: 10, likes: 16, dislikes: 4);

      expect(movie.likes, 16);
      movie.like();
      expect(movie.likes, 17);
      movie.like();
      expect(movie.likes, 16);

    });

    test('Dislike function should increment dislikes and undo the changes on calling twice',(){

      final movie = Movie(id: 1, title: 'title', description: 'description', image: 'image', rating: 10, likes: 16, dislikes: 4);

      expect(movie.dislikes, 4);
      movie.dislike();
      expect(movie.dislikes, 5);
      movie.dislike();
      expect(movie.dislikes, 4);

    });

    test('Calling Like function should automatically undo the changes done by Dislike function',(){

      final movie = Movie(id: 1, title: 'title', description: 'description', image: 'image', rating: 10, likes: 16, dislikes: 4);
  
      expect(movie.isLiked, false);
      expect(movie.isDisliked, false);
      movie.dislike();
      expect(movie.isLiked, false);
      expect(movie.isDisliked, true);
      movie.like();
      expect(movie.isLiked, true);
      expect(movie.isDisliked, false);
    
    });

    test('Calling Dislike function should automatically undo the changes done by Like function',(){

      final movie = Movie(id: 1, title: 'title', description: 'description', image: 'image', rating: 10, likes: 16, dislikes: 4);
  
      expect(movie.isLiked, false);
      expect(movie.isDisliked, false);
      movie.like();
      expect(movie.isLiked, true);
      expect(movie.isDisliked, false);
      movie.dislike();
      expect(movie.isLiked, false);
      expect(movie.isDisliked, true);

    });

  });
  

}