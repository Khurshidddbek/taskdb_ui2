import 'package:hive/hive.dart';
import 'package:taskdb_ui2/model/user_model.dart';

class HiveDB {
  var box = Hive.box('taskdb');

  void storeUser(User user) async {
    box.put('user', user.toJson());
  }

  User loadUser() {
    var user = new User.fromJson(box.get('user'));

    return user;
  }

  void removeUser() async {
    box.delete('user');
  }
}