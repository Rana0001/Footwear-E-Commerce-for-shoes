import 'package:footwear/helper/objectbox.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/state/objectbox_state.dart';

class UserDataSource {
  ObjectBoxInstance get _objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(User user) async {
    try {
      return _objectBoxInstance.addUser(user);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<User>> getUser() async {
    try {
      return _objectBoxInstance.getAllUser();
    } catch (e) {
      throw Exception("Error in getting all user");
    }
  }

  bool login(String username, String password) {
    try {
      return _objectBoxInstance.loginUser(username, password);
    } catch (e) {
      throw Exception("Login Unsuccessful");
    }
  }
}
