import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_app/domain/model/film.dart';
import 'package:film_app/my_icon/my_flutter_app_icons.dart';
import 'package:film_app/utils/app_utils.dart';
import 'package:flutter/material.dart';

class DetailFilmPage extends StatelessWidget {
  final Film film;

  DetailFilmPage({this.film});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.green,
                height: 250,
                width: double.infinity,
                child: Stack(
                  children: [
                    Hero(
                      tag: film.id.toString(),
                      child: CachedNetworkImage(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          imageUrl: film.posterPath),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 0, right: 20, bottom: 10),
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          film.title,
                          style: AppUtils.getFontMaisonBold(
                              fontSize: 20, textColor: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        iconSize: 22,
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 10)),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 22,
                              color: Colors.black,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(film.releaseDate,
                                style: AppUtils.getFontMaisonLight(
                                    fontSize: 15, textColor: Colors.black87))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.star,
                              size: 22,
                              color: Colors.black,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(film.voteAverage,
                                style: AppUtils.getFontMaisonLight(
                                    fontSize: 15, textColor: Colors.black87))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              MyFlutterAppIcons.liked,
                              size: 22,
                              color: Colors.black,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(film.voteCount,
                                style: AppUtils.getFontMaisonLight(
                                    fontSize: 15, textColor: Colors.black87))
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20,bottom: 30),
                  child: Text(
                    film.overview,
                    style: AppUtils.getFontMaisonBold(
                        fontSize: 18, textColor: Colors.black87),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
