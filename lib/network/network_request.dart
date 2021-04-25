import 'package:film_app/model/popular_film_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tuple/tuple.dart';

class NetworkRequest {
  final String DOMAIN = 'https://api.themoviedb.org/3/movie';
  final String API_KEY = '106430786838d70ef6fe1d70175f07a5';

  // bool: true -> case api response 200 , false: other cases.
  Future<Tuple2<bool, List<Film>>> getPopularFilmFromRemote(
      {int page = 1}) async {
    try {
      final response = await http.Client()
          .get(Uri.parse('$DOMAIN/popular?api_key=$API_KEY&page=$page'));
      if (response.statusCode == 200) {
        var filmsResponse = json.decode(response.body)['results'] as List;
        var films = filmsResponse
            .map((filmResponse) => Film(
                id: filmResponse['id'] ?? 0,
                title: filmResponse['original_title'] ?? '',
                overview: filmResponse['overview'] ?? '',
                posterPath:
                    'https://image.tmdb.org/t/p/w500${filmResponse['backdrop_path'] ?? ''}',
                releaseDate: filmResponse['release_date'] ?? '',
                voteAverage: filmResponse['vote_average'].toString() ?? '',
                voteCount: filmResponse['vote_count'].toString() ?? ''))
            .toList().where((film) => !film.posterPath.endsWith('w500')).toList();
        return Tuple2(true, films);
      } else if (response.statusCode == 400) {
        return Tuple2(false, <Film>[]);
      } else {
        return Tuple2(false, <Film>[]);
      }
    } catch (exception) {
      return Tuple2(false, <Film>[]);
    }
  }
}
