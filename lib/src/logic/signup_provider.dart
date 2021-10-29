import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:movie_db_provider_file_manage/src/data/model/user_table.dart';

class SignupProvider extends ChangeNotifier {
  bool _dataSaved = false;

  bool get dataSaved => _dataSaved;

  singUp(String userName, String password, int age, String email) async {
    var box = await Hive.openBox<UserTable>('userTable');
    box.add(UserTable(
      userName,
      password,
      age,
      email,
    ));
    _dataSaved = true;
    notifyListeners();
  }
}
