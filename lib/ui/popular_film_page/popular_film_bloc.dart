import 'package:film_app/domain/usecase/get_popular_films_usecase.dart';
import 'package:film_app/ui/popular_film_page/popular_film_event.dart';
import 'package:film_app/ui/popular_film_page/popular_film_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularFilmBloc extends Bloc<PopularFilmEvent, PopularFilmState> {
  PopularFilmBloc(PopularFilmState initialState, {this.getPopularFilmsUsecase})
      : super(initialState);

  int _page = 1;
  GetPopularFilmsUsecase getPopularFilmsUsecase;

  @override
  Stream<PopularFilmState> mapEventToState(PopularFilmEvent event) async* {
    if (event is LoadingPopularFilmEvent) {
      yield PopularFilmLoadingState(numberItemLoading: 15);
      var result = await getPopularFilmsUsecase.excute(page: 1);
      if (result.item1) {
        if (result.item2.length > 0) {
          yield ShowPopularFilmState(films: result.item2);
        } else {
          // show empty view
          yield ShowEmptyViewState();
        }
      } else {
        // show error view
        yield ShowErrorViewState();
      }
    } else if (event is LoadMorePopularFilmEvent) {
      _page += 1;
      var result = await getPopularFilmsUsecase.excute(page: _page);
      var currentPopularFilm = (state as ShowPopularFilmState).films;
      var newPopularFilm = currentPopularFilm;
      if (result.item1) {
        newPopularFilm = currentPopularFilm + result.item2;
      }
      yield ShowPopularFilmState(films: newPopularFilm);
    }
  }
}
