import 'dart:convert';
import 'package:film_app/data/mapper/film_mapper.dart';
import 'package:film_app/data/model/film_entity.dart';
import 'package:film_app/domain/model/film.dart';
import 'package:film_app/domain/repository/film_repository.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

class FilmRepositoryImpl implements FilmRepository {
  FilmMapper filmMapper;
  final String DOMAIN = 'https://api.themoviedb.org/3/movie';
  final String API_KEY = '106430786838d70ef6fe1d70175f07a5';

  FilmRepositoryImpl({this.filmMapper});

  @override
  Future<Tuple2<bool, List<Film>>> getPopularFilmFromRemote(
      {int page, http.Client client}) async {
    final response = await client
        .get(Uri.parse('$DOMAIN/popular?api_key=$API_KEY&page=$page'));
    if (response.statusCode == 200) {
      List<dynamic> filmResponses = json.decode(response.body)['results'];
      List<FilmEntity> filmEntities = filmResponses
          .map((filmResponse) => FilmEntity.fromJson(filmResponse))
          .toList();
      List<Film> films = filmEntities
          .map((filmEntity) => filmMapper.mapToDomain(filmEntity: filmEntity))
          .toList();
      return Tuple2(true, films);
    } else if (response.statusCode == 400) {
      return Tuple2(false, <Film>[]);
    } else {
      return Tuple2(false, <Film>[]);
    }
  }
}
