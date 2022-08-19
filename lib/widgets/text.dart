import 'package:flutter/material.dart';

Widget TextView(String txt, var size, var color_type, var font) {
  return Stack(
    children: [
      Text(
        txt,
        style: TextStyle(
          color: color_type,
          fontSize: size,
          fontWeight: font,
        ),
      ),
    ],
  );
}
