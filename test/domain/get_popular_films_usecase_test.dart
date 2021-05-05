import 'package:film_app/domain/model/film.dart';
import 'package:film_app/domain/usecase/get_popular_films_usecase.dart';
import 'package:http/http.dart';
import 'package:film_app/domain/repository/film_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:tuple/tuple.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

class MockRepository extends Mock implements FilmRepository {}

main() {
  test('test excute get_popular_films_usecase', () async {
    final clientMock = MockClient();
    final repositoryMock = MockRepository();
    when(repositoryMock.getPopularFilmFromRemote(page: 1, client: clientMock))
        .thenAnswer((_) async => Tuple2(true, <Film>[]));
    final getPopularFilmsUsecase = GetPopularFilmsUsecase(
        filmRepository: repositoryMock, client: clientMock);
    expect(await getPopularFilmsUsecase.excute(page: 1), isA<Tuple2>());
  });
}
