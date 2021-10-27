import 'package:flutter/foundation.dart';

class MovieDetailsProvider extends ChangeNotifier {
  String _movieName = '';
  String _imagePath = '';
  String _rating = '';
  String _description = '';

  String get movieName => _movieName;
  String get imagePath => _imagePath;
  String get rating => _rating;
  String get description => _description;

  setMovieDetails(String movieN, String imageP, String rate, String desc) {
    _movieName = movieN;
    _imagePath = imageP;
    _rating = rate;
    _description = desc;
    notifyListeners();
  }
}
