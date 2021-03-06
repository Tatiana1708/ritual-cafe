import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ritual_cafe/model/user.dart';
import 'package:ritual_cafe/utils/app_url.dart';
import 'package:ritual_cafe/utils/shared_preference.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'user': {'email': email, 'password': password}
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
      AppUrl.login,
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body.toString())['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(
    String email,
    String tel,
    String firstname,
    String surname,
    String password,
  ) async {
    final Map<String, dynamic> registrationData = {
      'user': {
        'email': email,
        'tel': tel,
        'firstname': firstname,
        'surname': surname,
        'password': password,
      }
    };
    return await post(AppUrl.register,
        body: json.encode(registrationData),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        }).then(onValue).catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData =
        json.decode(response.body.toString());

    print(response.statusCode);
    if (response.statusCode == 200) {
      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
//      if (response.statusCode == 401) Get.toNamed("/login");
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
