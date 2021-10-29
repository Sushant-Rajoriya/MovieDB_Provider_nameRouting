import 'package:flutter/material.dart';
import 'package:movie_db_provider_file_manage/src/logic/login_provider.dart';
import 'package:movie_db_provider_file_manage/src/logic/movie_details_provider.dart';
import 'package:movie_db_provider_file_manage/src/logic/movies_provider.dart';
import 'package:movie_db_provider_file_manage/src/logic/search_movie_provider.dart';
import 'package:movie_db_provider_file_manage/src/logic/signup_provider.dart';
import 'package:movie_db_provider_file_manage/src/screens/home/home_screen.dart';
import 'package:movie_db_provider_file_manage/src/screens/login/login.dart';
import 'package:movie_db_provider_file_manage/src/screens/movie_details/movie_details_screen.dart';
import 'package:movie_db_provider_file_manage/src/screens/search/search_screen.dart';
import 'package:movie_db_provider_file_manage/src/screens/singup/signup.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static const homeScreen = "/";
  static const loginScreen = "/login";
  static const signupScreen = "/signup";
  static const searchScreen = "/searchScreen";
  static const movieDetailsScreen = "/movieDetails";

  final MovieProvider _movieProvider = MovieProvider();

  final MovieDetailsProvider _movieDetailsProvider = MovieDetailsProvider();

  final SearchMovieProvider _searchMovieProvider = SearchMovieProvider();

  final LoginProvider _loginProvider = LoginProvider();

  final SignupProvider _signupProvider = SignupProvider();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(providers: [
            ChangeNotifierProvider.value(
              value: _movieProvider,
            ),
            ChangeNotifierProvider.value(
              value: _movieDetailsProvider,
            ),
            ChangeNotifierProvider.value(
              value: _loginProvider,
            )
          ], child: const HomeScreen(userName: 'Shaan')),
        );
      case searchScreen:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider.value(
                    value: _searchMovieProvider,
                  ),
                  ChangeNotifierProvider.value(
                    value: _movieDetailsProvider,
                  )
                ], child: const SearchScreen()));

      case movieDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
                value: _movieDetailsProvider,
                child: const MovieDetailsScreen()));

      case loginScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
                  value: _loginProvider,
                  child: const LoginScreen(),
                ));

      case signupScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
                  value: _signupProvider,
                  child: const SignupScreen(),
                ));

      default:
        {
          throw ('This Page not Exist');
        }
    }
  }

  void dispose() {
    _movieProvider.dispose();
    _loginProvider.dispose();
    _movieDetailsProvider.dispose();
    _searchMovieProvider.dispose();
    _signupProvider.dispose();
  }
}
