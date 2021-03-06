import 'package:flutter/material.dart';
import 'package:flutter_app_your_story/helper/helper.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesCardWidget extends StatelessWidget {
  var height, width, index, moviesList, base;

  MoviesCardWidget(
      {this.height, this.width, this.index, this.moviesList, this.base});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width - 190,
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    moviesList[index].originalTitle.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: base,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      Text(
                        moviesList[index].voteAverage.toString(),
                        // textScaleFactor: base,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Container(
                          child: Icon(
                        Icons.star,
                        size: 16,
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    moviesList[index].originalLanguage.toString(),
                    textScaleFactor: base * 0.7,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Text(
                    moviesList[index].popularity.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width - 110,
            margin: EdgeInsets.only(left: 12, top: 18),
            child: Text(
              moviesList[index].overview.toString(),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: base * 0.7,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12,top: 4),
            child: InkWell(
                onTap: () async {
                  await launch(Urls.clickMe);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Get Details Of Repo',
                    style: TextStyle(color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
