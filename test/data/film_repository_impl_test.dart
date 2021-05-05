import 'package:film_app/data/film_repository_impl.dart';
import 'package:film_app/data/mapper/film_mapper.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

class MockClient extends Mock implements http.Client {}

main() {
  final String DOMAIN = 'https://api.themoviedb.org/3/movie';
  final String API_KEY = '106430786838d70ef6fe1d70175f07a5';
  final String demoStringApiResponse =
      '{"page": 1,"results": [{"id": 460465,"backdrop_path": "/abc"}]}';
  final clientMock = MockClient();
  final filmMapper = FilmMapper();
  FilmRepositoryImpl filmRepositoryImpl;

  group('test function getPopularFilmFromRemote', () {
    setUp(() {
      filmRepositoryImpl = FilmRepositoryImpl(filmMapper: filmMapper);
    });

    test('test function getPopularFilmFromRemote in case 200', () async {
      when(clientMock.get(Uri.parse('$DOMAIN/popular?api_key=$API_KEY&page=1')))
          .thenAnswer((_) async => http.Response(demoStringApiResponse, 200));
      expect(
          await filmRepositoryImpl.getPopularFilmFromRemote(
              page: 1, client: clientMock),
          isA<Tuple2>());
    });

    test('test function getPopularFilmFromRemote in case 400', () async {
      when(clientMock.get(Uri.parse('$DOMAIN/popular?api_key=$API_KEY&page=1')))
          .thenAnswer((_) async => http.Response(demoStringApiResponse, 400));
      expect(
          await filmRepositoryImpl.getPopularFilmFromRemote(
              page: 1, client: clientMock),
          isA<Tuple2>());
    });

    test('test function getPopularFilmFromRemote other cases', () async {
      when(clientMock.get(Uri.parse('$DOMAIN/popular?api_key=$API_KEY&page=1')))
          .thenAnswer((_) async => http.Response(demoStringApiResponse, 500));
      expect(
          await filmRepositoryImpl.getPopularFilmFromRemote(
              page: 1, client: clientMock),
          isA<Tuple2>());
    });
  });
}
