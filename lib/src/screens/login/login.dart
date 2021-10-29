import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_provider_file_manage/src/coman/my_widget/my_text_field.dart';
import 'package:movie_db_provider_file_manage/src/coman/router/app_route.dart';
import 'package:movie_db_provider_file_manage/src/logic/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider loginProvider = Provider.of<LoginProvider>(context);

  @override
  Widget build(BuildContext context) {
    loginProvider.chcekUser();
    String userName = "";
    String password = "";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 30,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Consumer<LoginProvider>(
                builder: (context, value, Widget? child) {
                  if (value.isLogin) {
                    Navigator.of(context).pushNamed(AppRoute.homeScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username or Password Worng '),
                        duration: Duration(microseconds: 10000),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                child: Text(
                  "Welcome Back !",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    textStyle: const TextStyle(letterSpacing: .5, fontSize: 35),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Log in",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                textStyle: const TextStyle(
                                    letterSpacing: .5, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            MyTextField(
                              labelText: 'User Name',
                              keyboardType: TextInputType.text,
                              isPassword: false,
                              onChanged: (value) {
                                userName = value;
                              },
                            ),
                            MyTextField(
                              labelText: 'Password',
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                loginProvider.login(userName, password);
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.signupScreen);
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.lato(
                    color: Colors.blueAccent,
                    textStyle: const TextStyle(letterSpacing: .5, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
