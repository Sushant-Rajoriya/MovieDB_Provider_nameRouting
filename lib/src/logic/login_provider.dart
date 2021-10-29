import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:movie_db_provider_file_manage/src/data/model/user_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  String _userName = '';
  bool _isLogin = false;

  String get userName => _userName;

  bool get isLogin => _isLogin;

  addUser(String userName) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString("UserId", userName);
  }

  chcekUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    _userName = _sharedPreferences.getString("UserId") ?? 'S';
    if (_userName == 'S') {
      _isLogin = false;
    } else {
      _isLogin = true;
    }
    notifyListeners();
  }

  logout() async {
    _sharedPreferences.remove("UserId");
    _userName = '';
    notifyListeners();
  }

  login(String userName, String password) async {
    var box = await Hive.openBox<UserTable>('userTable');
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i)!.userName == userName &&
          box.getAt(i)!.password == password) {
        addUser(userName);
        _isLogin = true;
      }
    }
    notifyListeners();
  }
}
