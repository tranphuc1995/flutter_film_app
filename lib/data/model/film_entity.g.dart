// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmEntity _$FilmEntityFromJson(Map<String, dynamic> json) {
  return FilmEntity(
    id: json['id'] as int,
    original_title: json['original_title'] as String,
    overview: json['overview'] as String,
    backdrop_path: json['backdrop_path'] as String,
    release_date: json['release_date'] as String,
    vote_average: (json['vote_average'] as num)?.toDouble(),
    vote_count: (json['vote_count'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FilmEntityToJson(FilmEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'backdrop_path': instance.backdrop_path,
      'release_date': instance.release_date,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
