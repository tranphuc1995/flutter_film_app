import 'package:film_app/domain/model/film.dart';

abstract class PopularFilmState {}

class PopularFilmLoadingState extends PopularFilmState {
  int numberItemLoading;

  PopularFilmLoadingState({this.numberItemLoading = 0});
}

class ShowPopularFilmState extends PopularFilmState {
  List<Film> films;

  ShowPopularFilmState({this.films});
}

class ShowEmptyViewState extends PopularFilmState{
}

class ShowErrorViewState extends PopularFilmState{
}
