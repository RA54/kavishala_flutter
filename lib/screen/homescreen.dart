import 'package:flutter/material.dart';
import 'package:kavishala_flutter/util/constants.dart';
import 'package:kavishala_flutter/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              TextView("Kavishala", 24.0, kBlack, FontWeight.bold),
            ],
          )
        ],
      ),
    );
  }
}
