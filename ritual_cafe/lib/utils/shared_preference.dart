import 'package:ritual_cafe/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.tel);
    prefs.setString("firstname", user.firstname);
    prefs.setString("surname", user.surname);
    prefs.setString("password", user.password);
    prefs.setString("token", user.token);

    print("object prefere");
    print(user.renewalToken);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String email = prefs.getString("email");
    String tel = prefs.getString("tel");
    String firstname = prefs.getString("firstname");
    String surname = prefs.getString("surname");
    String password = prefs.getString("password");
    String token = prefs.getString("token");
    String renewalToken = prefs.getString("renewalToken");

    return User(
        userId: userId,
        email: email,
        tel: tel,
        firstname: firstname,
        surname: surname,
        password: password,
        token: token,
        renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("email");
    prefs.remove("tel");
    prefs.remove("firstname");
    prefs.remove("surname");
    prefs.remove("password");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
