import 'package:film_app/ui/popular_film_page/popular_film_event.dart';
import 'package:film_app/network/network_request.dart';
import 'package:film_app/ui/popular_film_page/popular_film_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularFilmBloc extends Bloc<PopularFilmEvent, PopularFilmState> {
  PopularFilmBloc(PopularFilmState initialState) : super(initialState);

  NetworkRequest _networkRequest = NetworkRequest();
  int _page = 1;

  @override
  Stream<PopularFilmState> mapEventToState(PopularFilmEvent event) async* {
    if (event is LoadingPopularFilmEvent) {
      yield PopularFilmLoadingState(numberItemLoading: 15);
      var result = await _networkRequest.getPopularFilmFromRemote(page: _page);
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
      var result = await _networkRequest.getPopularFilmFromRemote(page: _page);
      var currentPopularFilm = (state as ShowPopularFilmState).films;
      var newPopularFilm = currentPopularFilm;
      if (result.item1) {
        newPopularFilm = currentPopularFilm + result.item2;
      }
      yield ShowPopularFilmState(films: newPopularFilm);
    }
  }
}
