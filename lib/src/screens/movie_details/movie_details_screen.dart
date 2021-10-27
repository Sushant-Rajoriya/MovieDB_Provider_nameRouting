import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_provider_file_manage/src/logic/movie_details_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsProvider movieDetailsProvider =
      Provider.of<MovieDetailsProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              movieDetailsProvider.imagePath,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieDetailsProvider.movieName,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            letterSpacing: .5,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 25,
                    color: Colors.yellow,
                    child: Center(
                      child: Text(
                        "IMDB " + movieDetailsProvider.rating,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                movieDetailsProvider.description,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.black, letterSpacing: .5, fontSize: 15),
                ),
                maxLines: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
