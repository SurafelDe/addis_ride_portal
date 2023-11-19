import 'package:get/get.dart';
import '../ui/controllers/main_screen_controller.dart';

class Dependency {
  static var notification = Get.find<MainScreenController>();

  static Future init() async {
    Get.put(MainScreenController());
  }
}
