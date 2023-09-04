import 'package:hive/hive.dart';

part 'adaptors/images_model.g.dart';

@HiveType(typeId: 4)
class Images {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String imageName;

  Images({
    required this.id,
    required this.imageName,
  });

  factory Images.fromJson(Map<String, dynamic> jsonImage) {
    return Images(
      id: jsonImage["id"],
      imageName: jsonImage["imageName"],
    );
  }
}
