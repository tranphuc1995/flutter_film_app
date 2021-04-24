import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_app/model/popular_film_response.dart';
import 'package:film_app/ui/detail_film_page/detail_film_page.dart';
import 'package:film_app/utils/AppUtils.dart';
import 'package:flutter/material.dart';


class PopularItem extends StatelessWidget {
  final Film film;

  PopularItem({this.film});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
                builder: (context) => DetailFilmPage(
                      film: film,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
               child: Hero(
                 tag: film.id.toString(),
                 child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: film.posterPath,
                  placeholder: _loader,
              ),
               ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 40,
                color: Colors.black45,
                child: Text(film.title,
                    style: AppUtils.getFontMaisonBold(
                        fontSize: 13, textColor: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loader(BuildContext context, String url) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(bottom: 40),
      child: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 20.0,
          width: 20.0,
        ),
      ),
    );
  }
}
