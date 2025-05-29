import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 0)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  String dateTime;

  @HiveField(1)
  String latitude;

  @HiveField(2)
  String longitude;

  @HiveField(3)
  String status;

  @HiveField(4)
  String email;

  AttendanceModel({
    required this.dateTime,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.email,
  });
}

