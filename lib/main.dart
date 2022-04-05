import 'package:allcheck/attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_controller.dart';
import 'test.dart';
import 'setting.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AttendanceModelAdapter());
  await Hive.openBox<AttendanceModel>('attendance');

  Get.put(MainController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AllCheck',
      theme: ThemeData(
        // primarySwatch: Colors.black,
      ),
      home: const MyHomePage(title: 'AllCheck Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [Test(), Test(), Test(), Test(), Setting()];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('11111'),

          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle ,
                color: Color(0xFF5AAEC4),
                size: 30.0,
              ),
              onPressed: () {
                // Get.to(() => CouponAdd());
              },
            ),
          ],
        ),

        body: _pages[MainController.to.tab_index.value],
        bottomNavigationBar: BottomNavigationBar(
          // 라벨 안보이게
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          // 3이상이면 타입 고정해야
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xFF5AAEC4),
          backgroundColor: const Color(0xFF2B2D30),
          onTap: (index) {
            MainController.to.tab_index.value = index;
          },
          currentIndex: MainController.to.tab_index.value,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '지급',
              icon: Icon(Icons.offline_pin_rounded),
            ),
            BottomNavigationBarItem(
              label: '개별',
              icon: Icon(Icons.groups_rounded),
            ),
            BottomNavigationBarItem(
              label: '학급온도계',
              icon: Icon(Icons.device_thermostat),
            ),
            BottomNavigationBarItem(
              label: '쿠폰',
              icon: Icon(Icons.discount_rounded),
            ),
            BottomNavigationBarItem(
              label: '설정',
              icon: Icon(Icons.construction_rounded),
            ),
          ],
        ),
        floatingActionButton: MainController.to.tab_index.value == 0
            ? FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {

          },
          tooltip: 'Increment',
          // child: const Icon(Icons.add),
          child: Text(
            "지급",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            : null,
      ),
    );
  }
}
