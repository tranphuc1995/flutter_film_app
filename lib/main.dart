import 'package:film_app/ui/popular_film_page/popular_film_bloc.dart';
import 'package:film_app/ui/popular_film_page/popular_film_state.dart';
import 'package:film_app/ui/popular_film_page/popular_film_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// localization
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
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
          create: (context) => PopularFilmBloc(PopularFilmLoadingState()),
          child: PopularFilmPage())));
}
