import 'package:flutter/material.dart';
import 'package:kavishala_flutter/controller_starter.dart';
import 'package:kavishala_flutter/screen/homescreen.dart';
import 'package:kavishala_flutter/screen/loginactivity.dart';
import 'package:kavishala_flutter/screen/splashscreen.dart';
import 'package:kavishala_flutter/util/router.dart';
import 'package:kavishala_flutter/util/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ControllerStarterBinding().dependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BrandTheme.NormalTheme,
      //initialRoute: MyRoutes.splashRoute,
      routes: {
        "/": (context) => HomeScreen(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LoginActivity(),
      },
    );
  }
}


