import 'package:get/get.dart';
import 'AllControllers/home_controler.dart';
 
class ControllerStarterBinding extends Bindings { 
  @override 
  void dependencies() { 
    Get.lazyPut(() => HomeController());
  }
}