
import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 1)
class AttendanceModel {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final String name;

  AttendanceModel({
    required this.number,
    required this.name,
});

}