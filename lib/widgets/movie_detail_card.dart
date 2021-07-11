import 'package:flutter/material.dart';


class MovieDetailCard extends StatelessWidget {
  var width,movies;
  MovieDetailCard({this.width,this.movies});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.only(top: 8,left: 8,right: 8),
              child: Row(
                children: [
                  Container(
                    height: 28,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(
                            Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "PREMERE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    height: 28,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(
                            Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Streaming Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          //color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(
                                Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "Rent 149",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          //color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(
                                Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "Buy 699",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, top: 8),
              width: width - 16,
              child: Text(
                movies.originalTitle
                    .toString(),
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, top: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  movies
                      .originalLanguage
                      .toString() +
                      ", +2",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, top: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Release Date: " +
                      movies
                          .releaseDate.toString()
                          .substring(0,10)
                          .toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, left: 8),
              child: Text(
                movies.overview
                    .toString(),
                style: TextStyle(
                  //fontWeight: FontWeight.bold
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
