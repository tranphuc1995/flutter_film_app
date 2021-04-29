import 'package:json_annotation/json_annotation.dart';



class Film {
  int id;
  String title;
  String overview;
  String posterPath;
  String releaseDate;
  String voteAverage;
  String voteCount;

  Film({this.id = 0, this.title = '', this.overview = '', this.posterPath = '', this.releaseDate= '', this.voteAverage = '',this.voteCount=''});
}


