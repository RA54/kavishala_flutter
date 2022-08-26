import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kavishala_flutter/screen/loginactivity.dart';
import 'package:kavishala_flutter/util/constants.dart';
import 'package:kavishala_flutter/widgets/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> list = [
      "https://images.unsplash.com/photo-1612760721786-a42eb89aba02?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=675&q=80",
      "https://images.unsplash.com/photo-1579762715459-5a068c289fda?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80",
      "https://images.unsplash.com/photo-1579762715118-a6f1d4b934f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=631&q=80"
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,// by deafault ya center ho ta ha na
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.04),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    child: Image.asset("assets/images/logo_main.png"),
                  ),
                ),
                SizedBox(height: 9),
                TextView("Kavishala", 24.0, kBlack, FontWeight.bold),
                SizedBox(height: 9),
                TextView("Make reading & writing your habit", 14.0, kSilver, FontWeight.w600),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.7,
              ),
              items: list
                  .map((currentItem) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(currentItem,
                              width: 1000,
                              height: 2000,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
            Column(
              children: <Widget>[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.8, 52),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    primary: kBlack,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // <-- Radius
                    ),
                  ),
                  onPressed: () {},
                  icon: TextView("Join Us for free", 16.0, Colors.white, FontWeight.bold),
                  label: SvgPicture.asset(
                    "assets/icons/forward_arrow.svg",
                    height: 16,
                    width: 9,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                TextView("or", 14.0, kSilver, FontWeight.w600),
                SizedBox(height: 6),
                SizedBox(
                  height: 52,
                  width: size.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      primary: Colors.white,
                      onPrimary: kBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // <-- Radius
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextView("Continue As Guest", 16.0, kBlack, FontWeight.bold),
                        SizedBox(width: 7),
                        SvgPicture.asset(
                          "assets/icons/forward_arrow.svg",
                          height: 16,
                          width: 9,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Get.to(LoginActivity());
                    print("Hello");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView("Already have an account? ", 14.0, kSilver,
                          FontWeight.w600),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
