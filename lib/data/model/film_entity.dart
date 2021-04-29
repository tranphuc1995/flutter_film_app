import 'package:json_annotation/json_annotation.dart';
part 'film_entity.g.dart';


@JsonSerializable(explicitToJson: true)
class FilmEntity {
  int id;
  String original_title;
  String overview;
  String backdrop_path;
  String release_date;
  double vote_average;
  double vote_count;

  FilmEntity({this.id = 0, this.original_title = '', this.overview = '', this.backdrop_path = '', this.release_date= '', this.vote_average = 0,this.vote_count=0});

  factory FilmEntity.fromJson(Map<String, dynamic> json) => _$FilmEntityFromJson(json);
  Map<String, dynamic> toJson() => _$FilmEntityToJson(this);
}


