import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kavishala_flutter/screen/homescreen.dart';
import 'package:kavishala_flutter/util/constants.dart';

class LoginActivity extends StatelessWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //Get.offAll(() => HomeScreen());
                    print("Tapped");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Skip',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: kSilver,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 7),
                      SvgPicture.asset(
                        "assets/icons/forward_arrow.svg",
                        height: 15,
                        width: 7,
                        color: kSilver,
                      ),
                      SizedBox(width: 7),
                    ],
                  ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/logo_main.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: size.height * 0.08),
                Container(
                  width: size.width * 0.8,
                  height: 52,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Continue with Google",
                    onPressed: () {
                    },
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: size.width * 0.8,
                  height: 52,
                  child: SignInButton(
                    Buttons.Twitter,
                    text: "Continue with Twitter",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: size.width * 0.8,
                  height: 52,
                  child: SignInButton(
                    Buttons.Facebook,
                    text: "Continue with Facebook",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: size.width * 0.8,
                  height: 52,
                  child: SignInButtonBuilder(
                    text: 'Continue with Email',
                    icon: Icons.email,
                    onPressed: () {},
                    backgroundColor: Colors.blueGrey[700]!,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  'New User?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: kSilver,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
