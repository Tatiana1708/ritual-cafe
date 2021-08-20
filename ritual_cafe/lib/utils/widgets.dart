import 'package:flutter/material.dart';
import 'package:ritual_cafe/themes/color.dart';

MaterialButton longButtons(String title, Function fun,
    {Color color: const Color(0xFFCA7340), Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

label(String title) => Text(
      title,
      style: TextStyle(
        color: Palette.textColor,
      ),
    );

InputDecoration buildInputDecoration(
  String hintText,
  Color color,
  /*IconData icon*/
) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Palette.textColor, fontSize: 10),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    filled: true,
    fillColor: Colors.grey.shade100.withOpacity(0.1),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}
