import 'package:flutter/material.dart';
import 'package:movie_db_provider_file_manage/src/coman/router/app_route.dart';
import 'package:movie_db_provider_file_manage/src/resource/my_colors.dart';

class MyTopBar extends StatelessWidget {
  final String userName;
  const MyTopBar({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hello $userName !",
                style: textBlack20,
              ),
              Text("Welcome to MovieDB app",
                  style: textBlack20.copyWith(fontSize: 14)),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.searchScreen);
            },
            child: const Icon(
              Icons.search,
              color: Colors.black,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
