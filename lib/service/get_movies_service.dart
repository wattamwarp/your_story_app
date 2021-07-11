import 'dart:convert';
import 'package:flutter_app_your_story/helper/urls.dart';
import 'package:flutter_app_your_story/model/movie_model.dart';
import 'package:http/http.dart' as http;

class GetMoviesService{

  static var client = http.Client();

  Future<List<Result>> getMovies() async {
    Uri uri = Uri.parse(Urls.mainUrl);

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      var data = MoviesModel.fromJson(jsonString);
      List<Result> list = data.results;
      return list;
    } else {
      return null;
    }
  }
}