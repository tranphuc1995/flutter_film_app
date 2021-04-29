import 'package:film_app/data/film_repository_impl.dart';
import 'package:film_app/data/mapper/film_mapper.dart';
import 'package:film_app/domain/repository/film_repository.dart';
import 'package:film_app/domain/usecase/get_popular_films_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt getIt = GetIt.instance;

void setupFilmDI() {

  // provide FilmMapper
  getIt.registerFactory<FilmMapper>(() => FilmMapper());

  // provide FilmRepository
  getIt.registerLazySingleton<FilmRepository>(
      () => FilmRepositoryImpl(filmMapper: getIt<FilmMapper>()));

  // provide  http.Client
  getIt.registerFactory<http.Client>(() => http.Client());

  // provide GetPopularFilmsUsecase
  getIt.registerFactory<GetPopularFilmsUsecase>(() => GetPopularFilmsUsecase(
      filmRepository: getIt<FilmRepository>(), client: getIt<http.Client>()));
}
