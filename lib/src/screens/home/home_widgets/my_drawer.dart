import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  final String userName;
  const MyDrawer({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: .5, fontSize: 30),
                  ),
                ),
                Text(
                  "Edit Profile",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: .5, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 20),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
