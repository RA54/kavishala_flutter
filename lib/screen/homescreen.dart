import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kavishala_flutter/AllControllers/home_controler.dart';
import 'package:kavishala_flutter/util/constants.dart';
import 'package:get/get.dart';
import 'package:kavishala_flutter/util/helpfunction.dart';
import 'package:kavishala_flutter/widgets/Drawer.dart';
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
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 25, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: TextView("Kavishala", 24.0, kBlack, FontWeight.w800),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30, // Changing Drawer Icon Size
                ),
                onPressed: () {
                  print("ok");
                },
              ),
              Image.asset(
                "assets/images/logo_main.png",
                width: 30,
                height: 30,
              ),
              SizedBox(width: 5)
            ],
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 18),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.sootradharPojolist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: kSilver),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                homeController.sootradharPojolist[index].image),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 37),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      // BoxShadow(
                      //   color: Colors.black,
                      //   blurRadius: 1,
                      //   spreadRadius: 0,
                      // ),
                      // BoxShadow(
                      //   color: Colors.white,
                      //   blurRadius: 10,
                      //   spreadRadius: 5,
                      // ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(21, 16, 21, 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView("Good Afternoon", 18.0, kBlack, FontWeight.w600),
                              SizedBox(height: 5),
                              TextView(
                                  "Have a nice day Start the day by sharing your thoughts with us... ",
                                  13.0,
                                  kSilver,
                                  FontWeight.w400),
                            ],
                          ),
                        ),
                        SizedBox(width: 21),
                        Image.asset(
                          getTimewiseassets(),
                          width: 94,
                          height: 94,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 37),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    // aspectRatio: 16 / 9,
                    height: 210,
                    viewportFraction: 1,
                  ),
                  items: homeController.myAllCoroselImage.map((jsonArray) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: NetworkImage(jsonArray["image"]),
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 37),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView("Latest picks for you", 15.0, kBlack, FontWeight.w600),
                    TextView("View all", 13.0, kSilver, FontWeight.w500),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.allOpinions.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          for (var itm in homeController.allOpinions["results"])
                            GestureDetector(
                              onTap: () {
                                print("Love");
                              },
                              child: Container(
                                height: 170,
                                width: 120,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(7, 11, 7, 11),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          itm["image"],
                                          height: 100.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(itm["title"], textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


