import 'package:flutter/material.dart';

Widget editTextWidget(String label, bool pass,var value_txt) {
  return Stack(
    children: [
      TextFormField(
        obscureText: pass,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        validator: (value){
          if(value!.isEmpty){
              return value_txt;
          }
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Color.fromRGBO(173, 183, 192, 1),
              fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
          ),
        ),
      ),
    ],
  );
}
