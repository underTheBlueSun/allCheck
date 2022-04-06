import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'attendance_model.dart';
import 'attendance_controller.dart';

class Attendance extends StatelessWidget {

  void renderDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // 다이얼로그 밖 클릭시 안사라지게
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: SizedBox(
            height: 70.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF5AAEC4),
                      child: Center(
                        child: Text(
                          (AttendanceController.to.retAttendanceLength()+1).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        onSubmitted: (value) {
                          if (value != "") {
                            AttendanceController.to.addAttendance(value);
                            Navigator.pop(context);
                            // Get.to(() => Attendance());
                            // Get.to(() => Attendance(), arguments: 'add');

                          }
                        },
                        decoration: InputDecoration(
                          labelText: '이름을 입력하세요',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      var box = Hive.box('attendance');
                      box.deleteFromDisk();
                    },
                    child: Text(
                      '전부삭제',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '닫기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  FloatingActionButton button = FloatingActionButton(
  backgroundColor: Colors.orange,
  onPressed: () {
  // renderDialog(context);
  },
  child: Icon(
  Icons.add,
  size: 30.0,
  ),
  );





  @override
  Widget build(BuildContext context) {

    if (1==1) {
      button.onPressed!();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '출석부',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (_, index) {
            return Text('aaaa');
          },
          separatorBuilder: (_, index) {
            return Divider();
          },
          itemCount: 10,
        ),
      ),
        floatingActionButton: button,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange,
      //   onPressed: () {
      //     renderDialog(context);
      //   },
      //   child: Icon(
      //     Icons.add,
      //     size: 30.0,
      //   ),
      // ),
    );
  }
}
