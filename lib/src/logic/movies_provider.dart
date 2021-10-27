import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_provider_file_manage/src/coman/keys/keys.dart';

class MovieProvider extends ChangeNotifier {
  List _treandingMovies = [];

  MovieProvider() {
    fatchTrendingMovie();
  }

  List get treandingMovies => _treandingMovies;

  fatchTrendingMovie() async {
    final trendingResult = await http.get(
      Uri.parse('${Keys.tmDbBasicPath}trending/all/day?api_key=${Keys.apiKey}'),
    );
    _treandingMovies = json.decode(trendingResult.body)['results'];

    notifyListeners();
  }
}
