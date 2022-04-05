
import 'package:get/get.dart';


class MainController extends GetxController {
  static MainController get to => Get.find(); // Get.find<MainController>() 대신 MainController.to 사용가능

  RxInt tab_index = 0.obs;

  @override
  void onInit() async {
    super.onInit();

  }

} // MainController
