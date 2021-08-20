import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritual_cafe/model/user.dart';
import 'package:ritual_cafe/providers/auth.dart';
import 'package:ritual_cafe/providers/user_provider.dart';
import 'package:ritual_cafe/themes/color.dart';
import 'package:ritual_cafe/utils/validators.dart';
import 'package:ritual_cafe/utils/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  String _username, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => _username = value,
      decoration:
          buildInputDecoration("Adresse email", Colors.grey.withOpacity(0.1)),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration:
          buildInputDecoration("Mot de passe", Colors.grey.withOpacity(0.1)),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    final incription = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          color: Colors.grey.shade100.withOpacity(0.2),
          height: 45,
          minWidth: 346,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text("Créer un compte",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
        ),
      ],
    );

    var doLogin = () {
      // final form = formKey.currentState;
      Navigator.pushReplacementNamed(context, '/dashboard');
      // if (form.validate()) {
      //   form.save();

      //   final Future<Map<String, dynamic>> successfulMessage =
      //       auth.login(_username, _password);

      //   successfulMessage.then((response) {
      //     if (response['status']) {
      //       User user = response['user'];
      //       Provider.of<UserProvider>(context, listen: false).setUser(user);
      //       Navigator.pushReplacementNamed(context, '/dashboard');
      //     } else {
      //       Flushbar(
      //         title: "Login Failed ",
      //         message: response['message'].toString(),
      //         duration: Duration(seconds: 3),
      //       ).show(context);
      //     }
      //   });
      // } else {
      //   print("form is invalid");
      // }
    };

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                "Ritual Café",
                style: TextStyle(
                    color: Palette.primaryColor,
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 40),
              Text(
                "Connexions",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            transform: GradientRotation(314.92),
                            begin: Alignment.centerRight,
                            end: Alignment(43.13, 82.89),
                            colors: [
                              Color.fromARGB(20, 15, 18, 25),
                              Color.fromARGB(20, 86, 89, 95)
                            ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                          )
                        ],
                      ),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.0),
                                  label("Email"),
                                  SizedBox(height: 5.0),
                                  usernameField,
                                  SizedBox(height: 30.0),
                                  label("Mot de passe"),
                                  SizedBox(height: 5.0),
                                  passwordField,
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 45, horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 15.0),
                    auth.loggedInStatus == Status.Authenticating
                        ? loading
                        : longButtons("Connexion", doLogin),
                    SizedBox(height: 50.0),
                    incription
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
