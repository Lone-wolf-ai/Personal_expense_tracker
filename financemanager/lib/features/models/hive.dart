import 'package:hive/hive.dart';
part 'hive.g.dart';
@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime datetime;
  Add_data({
    required this.name,
    required this.explain,
    required this.amount,
    required this.IN,
    required this.datetime,
  });
  
}
