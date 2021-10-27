import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_provider_file_manage/src/coman/keys/keys.dart';
import 'package:movie_db_provider_file_manage/src/logic/movie_details_provider.dart';
import 'package:movie_db_provider_file_manage/src/logic/search_movie_provider.dart';
import 'package:movie_db_provider_file_manage/src/screens/home/home_widgets/movie_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchMovieProvider searchMovieProvider =
      Provider.of<SearchMovieProvider>(context, listen: false);
  late MovieDetailsProvider movieDetailsProvider =
      Provider.of<MovieDetailsProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextField(
                      onSubmitted: (value) {
                        searchMovieProvider.searchMovies(value);
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Movie Name',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Consumer<SearchMovieProvider>(
                  builder: (context, value, Widget? child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  itemCount: value.searchedMovies.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieWidget(
                      imagePath: value.searchedMovies[index]['poster_path'] ==
                              null
                          ? "https://www.cssauthor.com/wp-content/uploads/2015/03/Movies-Text-Effect-PSD.jpg"
                          : Keys.imageBasicPath +
                              value.searchedMovies[index]['poster_path'],
                      rating: value.searchedMovies[index]['vote_average']
                          .toString(),
                      movieName:
                          value.searchedMovies[index]['title'] ?? 'Loading',
                      deckP:
                          value.searchedMovies[index]['overview'] ?? 'Loading',
                      movieDetails: movieDetailsProvider,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
