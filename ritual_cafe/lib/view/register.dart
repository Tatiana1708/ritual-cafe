import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritual_cafe/model/user.dart';
import 'package:ritual_cafe/providers/auth.dart';
import 'package:ritual_cafe/providers/user_provider.dart';
import 'package:ritual_cafe/themes/color.dart';
import 'package:ritual_cafe/utils/validators.dart';
import 'package:ritual_cafe/utils/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = new GlobalKey<FormState>();

  String _email, _tel, _firstname, _username, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please enter username" : null,
      onSaved: (value) => _username = value,
      decoration:
          buildInputDecoration("Prénom & Nom", Colors.grey.withOpacity(0.1)),
    );
    final useremailField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => _email = value,
      decoration:
          buildInputDecoration("Adresse email", Colors.grey.withOpacity(0.1)),
    );
    final usertelField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please enter téléphone" : null,
      onSaved: (value) => _tel = value,
      decoration: buildInputDecoration(
          "Numéro de téléphone", Colors.grey.withOpacity(0.1)),
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
        Text(" Registering ... Please wait")
      ],
    );

    final connexion = Row(
      children: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          color: Colors.grey.shade100.withOpacity(0.2),
          height: 45,
          minWidth: 346,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text("Connexion",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );

    var doRegister = () {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        auth
            .register(_email, _tel, _firstname, _username, _password)
            .then((response) async {
          if (response['status']) {
            User user = response['data'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            await Flushbar(
              title: "Registration Failed",
              message: response.toString(),
              duration: Duration(seconds: 5),
            ).show(context);
          }
        });
      }
    };

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
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
                "Inscription",
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
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            label("Prénom & Nom"),
                            SizedBox(height: 5.0),
                            usernameField,
                            SizedBox(height: 10.0),
                            label("Adresse email"),
                            SizedBox(height: 5.0),
                            useremailField,
                            SizedBox(height: 10.0),
                            label("Numéro de téléphone"),
                            SizedBox(height: 5.0),
                            usertelField,
                            SizedBox(height: 10.0),
                            label("Mot de passe"),
                            SizedBox(height: 5.0),
                            passwordField,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    auth.loggedInStatus == Status.Authenticating
                        ? loading
                        : longButtons("Créer un compte", doRegister),
                    SizedBox(height: 20.0),
                    connexion
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
