import 'package:flutter/material.dart';
import 'package:movie_db_provider_file_manage/src/coman/keys/keys.dart';
import 'package:movie_db_provider_file_manage/src/logic/movie_details_provider.dart';
import 'package:movie_db_provider_file_manage/src/logic/movies_provider.dart';
import 'package:movie_db_provider_file_manage/src/resource/my_colors.dart';
import 'package:movie_db_provider_file_manage/src/screens/home/home_widgets/my_drawer.dart';
import 'package:movie_db_provider_file_manage/src/screens/home/home_widgets/my_top_bar.dart';
import 'package:provider/provider.dart';

import 'home_widgets/movie_widget.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieProvider movieProvider = Provider.of<MovieProvider>(context);
  late MovieDetailsProvider movieDetailsProvider =
      Provider.of<MovieDetailsProvider>(context);

  @override
  void dispose() {
    movieProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(userName: widget.userName),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTopBar(userName: widget.userName),
            Padding(
                padding: const EdgeInsets.all(20),
                child:
                    Center(child: Text("Feature Movies", style: textBlack20))),
            Expanded(
              child: Consumer<MovieProvider>(
                builder: (context, value, Widget? child) {
                  movieProvider.fatchTrendingMovie();
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    itemCount: value.treandingMovies.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var imageP = Keys.imageBasicPath +
                          value.treandingMovies[index]['poster_path'];

                      var rating = value.treandingMovies[index]['vote_average']
                          .toString();

                      var mName =
                          value.treandingMovies[index]['title'] ?? 'Loading';

                      var deckP =
                          value.treandingMovies[index]['overview'] ?? 'Loading';

                      return MovieWidget(
                        imagePath: imageP,
                        rating: rating,
                        movieName: mName,
                        deckP: deckP,
                        movieDetails: movieDetailsProvider,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
