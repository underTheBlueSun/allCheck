
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'attendance_model.dart';


class AttendanceController extends GetxController {
  static AttendanceController get to => Get.find(); // Get.find<MainController>() 대신 MainController.to 사용가능

  RxInt tab_index = 0.obs;

  @override
  void onInit() async {
    super.onInit();

  }

  int retAttendanceLength()  {
    var box = Hive.box('attendance');
    return box.length;
  }

  void addAttendance(value)  {
    var box = Hive.box('attendance');
    box.put(box.length + 1, AttendanceModel(number: box.length + 1, name: value));

  }

} // MainController
