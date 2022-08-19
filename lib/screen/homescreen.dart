import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kavishala_flutter/AllControllers/home_controler.dart';
import 'package:kavishala_flutter/util/constants.dart';
import 'package:get/get.dart';
import 'package:kavishala_flutter/widgets/text.dart';

var homeController = Get.find<HomeController>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    homeController.reloadScreenData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Center(
          child: TextView("Kavishala", 24.0, kBlack, FontWeight.w800),
        ),
        actions: [
          Image.asset("assets/images/logo_main.png",width: 28,height: 28,)
        ],
      ),
      body: Obx(() {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                  ),
                  items: homeController.myAllCoroselImage.map((jsonArray) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(jsonArray["image"]),
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
