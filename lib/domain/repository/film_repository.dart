import 'package:film_app/domain/model/film.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

abstract class FilmRepository {
  Future<Tuple2<bool, List<Film>>> getPopularFilmFromRemote(
      {int page, http.Client client});
}
