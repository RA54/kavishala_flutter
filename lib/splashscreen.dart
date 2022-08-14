import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Column(
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
            ),

            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
              ),
              items: list
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              e,
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
                SizedBox(
                  width: size.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlue,
                      foregroundColor: kWhite,
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: kBlue,
                      shadowBlur: 8,
                      shadowOffset: Offset(0, 4),
                      shadowSpread: -4,
                    ),
                    onPressed: () {},
                    child: TextView("Sign Up", 20.0, kBlack, FontWeight.bold),
                  ),
                ),
                SizedBox(height: 6),
                TextView("or", 14.0, kSilver, FontWeight.w600),
                SizedBox(height: 6),
                SizedBox(
                  width: size.width * 0.8,
                  child: RaisedButton(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {},
                    child: TextView("Login", 20.0, kBlack, FontWeight.bold),
                  ),
                ),

                TextView("Already have an account?", 15.0, kBlack, FontWeight.w600),
                SizedBox(height: size.height * 0.04),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
