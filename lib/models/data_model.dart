import 'package:hive/hive.dart';

import './images_model.dart';
part 'adaptors/data_model.g.dart';

@HiveType(typeId: 3)
class Data {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String avatar;
  @HiveField(4)
  final List<Images> images;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.images,
  });

  factory Data.fromJson(Map<String,dynamic> jsonData) {
    var jsonImages = jsonData["images"] as List<dynamic>;
    List<Images> imagesList =
        jsonImages.map((i) => Images.fromJson(i)).toList();

    return Data(
      id: jsonData["id"],
      firstName: jsonData["first_name"],
      lastName: jsonData["last_name"],
      avatar: jsonData["avatar"],
      images: imagesList,
    );
  }
}
