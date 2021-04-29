import 'package:film_app/domain/usecase/get_popular_films_usecase.dart';
import 'package:film_app/ui/popular_film_page/popular_film_bloc.dart';
import 'package:film_app/ui/popular_film_page/popular_film_state.dart';
import 'package:film_app/ui/popular_film_page/popular_film_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// localization
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import 'di/film_component.dart';

void main() {
  // init DI
  setupFilmDI();

  runApp(MaterialApp(
      // fontText, size
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'maison',
      ),

      // localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
          create: (context) => PopularFilmBloc(PopularFilmLoadingState(),
              getPopularFilmsUsecase: GetIt.instance<GetPopularFilmsUsecase>()),
          child: PopularFilmPage())));
}
