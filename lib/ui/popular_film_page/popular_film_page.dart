import 'package:film_app/ui/popular_film_page/popular_film_bloc.dart';
import 'package:film_app/ui/popular_film_page/popular_film_event.dart';
import 'package:film_app/ui/popular_film_page/popular_film_state.dart';
import 'package:film_app/ui/popular_film_page/popular_item.dart';
import 'package:film_app/ui/popular_film_page/popular_loading_item.dart';
import 'package:film_app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopularFilmPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularFilmState();
  }
}

class _PopularFilmState extends State<PopularFilmPage> {
  PopularFilmBloc _popularFilmBloc;
  var _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _popularFilmBloc = BlocProvider.of(context);
    _popularFilmBloc.add(LoadingPopularFilmEvent());
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          print('reach_top');
        } else {
          print('reach_bottom');
          _popularFilmBloc.add(LoadMorePopularFilmEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text(
            AppLocalizations.of(context).popularFilms,
            style: AppUtils.getFontMaisonBold(
                fontSize: 20, textColor: Colors.white),
          )),
          body: BlocBuilder<PopularFilmBloc, PopularFilmState>(
            builder: (context, state) {
              if (state is ShowEmptyViewState || state is ShowErrorViewState) {
                var content = '';
                if (state is ShowEmptyViewState) {
                  content = AppLocalizations.of(context).noData;
                } else {
                  content = AppLocalizations.of(context).error;
                }
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      content,
                      style: AppUtils.getFontMaisonBold(
                          fontSize: 15, textColor: Colors.black),
                    ),
                  ),
                );
              } else {
                List<Widget> items = [];
                if (state is PopularFilmLoadingState) {
                  for (int i = 0; i < (state).numberItemLoading; i++) {
                    items.add(LoadingItem());
                  }
                } else if (state is ShowPopularFilmState) {
                  items = state.films
                      .map((film) => PopularItem(film: film))
                      .toList();
                }

                return Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: items.length,
                      controller: _controller,

                      itemBuilder: (BuildContext context, index) {
                        return items[index];
                      }),
                );
              }
            },
          )),
    );
  }
}
