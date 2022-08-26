import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:kavishala_flutter/Models/sootradharpojo.dart';
import 'package:kavishala_flutter/util/api.dart';

class HomeController extends GetxController {
  var myAllCoroselImage = [].obs;

  final _dio = Dio();
  getAllMyCorouselImage() async {
    try {
      Response response = await _dio.get(Api.Carousel);
      if (response.statusCode == 200) {
        myAllCoroselImage.addAll(response.data);
      } else {
        print("Status Code Not 200");
      }
    } catch (e) {
      print("Api Call Error");
    }
  }

  Map allOpinions = {}.obs;
  getAllHomeOpinions() async {
    try {
      Response response = await Dio().get(Api.opinion);
      if (response.statusCode == 200) {
        print(response.data.toString());
        allOpinions.assignAll(response.data);
      } else {
        print("Status Code Not 200");
      }
    } catch (e) {
      print("Api Call Error");
    }
  }

  RxList<SootradharPojo> sootradharPojolist = <SootradharPojo>[].obs;
  getAllSootradhar() async {
    try {
      Response response = await _dio.get(Api.Sootradhar_main);
      if (response.statusCode == 200) {
      //  print(response.data.toString());
        for (int i = 0; i < response.data.length; i++) {
          //orderList.add(Order.fromJson(response.data[i]));
          var jsonArray = response.data[i];
          for(int j=0;j<jsonArray.length;j++){
            print(jsonArray[j]);
            sootradharPojolist.add(SootradharPojo.fromMap(jsonArray[j]));
          }
        }
      } else {
        print("Status Code Not 200");
      }
    } catch (e) {
      print("Api Call Error");
    }
  }

  reloadScreenData() {
    getAllMyCorouselImage();
    getAllHomeOpinions();
    getAllSootradhar();
  }
}
