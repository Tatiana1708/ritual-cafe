import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritual_cafe/providers/auth.dart';
import 'package:ritual_cafe/providers/user_provider.dart';
import 'package:ritual_cafe/view/dashboard.dart';
import 'package:ritual_cafe/view/login.dart';
import 'package:ritual_cafe/view/register.dart';

import 'model/user.dart';
import 'utils/shared_preference.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'Ritual Café',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            fontFamily: 'Poppins',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    // ignore: unnecessary_statements
                    else
                      (snapshot.data.token == null);
                    return Login();
                  // else
                  //   UserPreferences().removeUser();
                  // return Welcome(user: snapshot.data);
                }
              }),
          routes: {
            '/dashboard': (context) => DashBoard(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
          }),
          
    );
  }
}
