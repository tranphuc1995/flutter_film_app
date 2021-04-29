import 'package:film_app/data/model/film_entity.dart';
import 'package:film_app/domain/model/film.dart';

class FilmMapper {
  Film mapToDomain({FilmEntity filmEntity}) {
    return Film(
        id: filmEntity.id ?? 0,
        title: filmEntity.original_title ?? '',
        overview: filmEntity.overview ?? '',
        posterPath:
            'https://image.tmdb.org/t/p/w500${filmEntity.backdrop_path ?? ''}',
        releaseDate: filmEntity.release_date ?? '',
        voteAverage: filmEntity.vote_average.toString() ?? '',
        voteCount: filmEntity.vote_count.toString() ?? '');
  }
}
