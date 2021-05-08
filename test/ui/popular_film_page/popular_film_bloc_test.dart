import 'package:bloc_test/bloc_test.dart';
import 'package:film_app/domain/model/film.dart';
import 'package:film_app/domain/usecase/get_popular_films_usecase.dart';
import 'package:film_app/ui/popular_film_page/popular_film_bloc.dart';
import 'package:film_app/ui/popular_film_page/popular_film_event.dart';
import 'package:film_app/ui/popular_film_page/popular_film_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

class MockGetPopularFilmsUsecase extends Mock
    implements GetPopularFilmsUsecase {}

main() {
  final getPopularFilmsUsecase = MockGetPopularFilmsUsecase();
  PopularFilmBloc _popularFilmBloc;

  group('test popular_film_bloc', () {
    setUp(() {
      _popularFilmBloc = PopularFilmBloc(PopularFilmLoadingState(),
          getPopularFilmsUsecase: getPopularFilmsUsecase);
    });

    var films = <Film>[Film(), Film()];
    blocTest('test ShowPopularFilmState case',
        build: () {
          when(getPopularFilmsUsecase.excute(page: 1))
              .thenAnswer((_) async => Tuple2(true, films));
          return _popularFilmBloc;
        },
        act: (bloc) => bloc.add(LoadingPopularFilmEvent()),
        expect: () =>
            [isA<PopularFilmLoadingState>(), isA<ShowPopularFilmState>()]);

    blocTest('test ShowEmptyViewState case',
        build: () {
          when(getPopularFilmsUsecase.excute(page: 1))
              .thenAnswer((_) async => Tuple2(true, <Film>[]));
          return _popularFilmBloc;
        },
        act: (bloc) => bloc.add(LoadingPopularFilmEvent()),
        expect: () =>
            [isA<PopularFilmLoadingState>(), isA<ShowEmptyViewState>()]);

    blocTest('test ShowErrorViewState case',
        build: () {
          when(getPopularFilmsUsecase.excute(page: 1))
              .thenAnswer((_) async => Tuple2(false, <Film>[]));
          return _popularFilmBloc;
        },
        act: (bloc) => bloc.add(LoadingPopularFilmEvent()),
        expect: () =>
            [isA<PopularFilmLoadingState>(), isA<ShowErrorViewState>()]);

    blocTest('test ShowPopularFilmState in case load-more',
        build: () {
          when(getPopularFilmsUsecase.excute(page: 1))
              .thenAnswer((_) async => Tuple2(true, films));
          when(getPopularFilmsUsecase.excute(page: 2))
              .thenAnswer((_) async => Tuple2(true, <Film>[]));
          return _popularFilmBloc;
        },
        act: (bloc) => [
              bloc.add(LoadingPopularFilmEvent()),
              bloc.add(LoadMorePopularFilmEvent())
            ],
        expect: () => [
              isA<PopularFilmLoadingState>(),
              isA<ShowPopularFilmState>(),
              isA<ShowPopularFilmState>()
            ]);
  });
}
