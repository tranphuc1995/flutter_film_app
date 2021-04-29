import 'package:film_app/domain/repository/film_repository.dart';
import 'package:tuple/tuple.dart';
import 'package:film_app/domain/model/film.dart';
import 'package:http/http.dart' as http;

class GetPopularFilmsUsecase {
  FilmRepository filmRepository;
  http.Client client;

  GetPopularFilmsUsecase({this.filmRepository, this.client});

  Future<Tuple2<bool, List<Film>>> excute({int page}) async {
    var result =
        filmRepository.getPopularFilmFromRemote(page: page, client: client);
    return result;
  }
}
