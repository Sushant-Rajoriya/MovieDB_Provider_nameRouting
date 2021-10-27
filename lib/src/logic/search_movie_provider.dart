import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_provider_file_manage/src/coman/keys/keys.dart';

class SearchMovieProvider extends ChangeNotifier {
  List _searchedMovies = [];

  List get searchedMovies => _searchedMovies;

  searchMovies(String searchTerm) async {
    final searchResult = await http.get(
      Uri.parse(
          '${Keys.tmDbBasicPath}search/movie?api_key=${Keys.apiKey}&query=$searchTerm'),
    );
    _searchedMovies = json.decode(searchResult.body)['results'];
    notifyListeners();
  }
}
