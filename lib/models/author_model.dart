import 'package:hive/hive.dart';
part 'adaptors/author_model.g.dart';

@HiveType(typeId: 1)
class Auther {
  @HiveField(0)
  final String firstname;
  @HiveField(1)
  final String lastname;

  Auther({
    required this.firstname,
    required this.lastname,
  });

  factory Auther.fromJson(Map<String, dynamic> jsonAuther) {
    return Auther(
      firstname: jsonAuther["first_name"],
      lastname: jsonAuther["last_name"],
    );
  }
}
