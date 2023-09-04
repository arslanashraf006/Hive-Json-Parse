import 'package:hive/hive.dart';
import './author_model.dart';
import './data_list_model.dart';
part 'adaptors/book_model.g.dart';

@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  final int page;
  @HiveField(1)
  final int perPage;
  @HiveField(2)
  final int total;
  @HiveField(3)
  final int totalPages;
  @HiveField(4)
  final Auther? auther;
  @HiveField(5)
  final DataList? data;

  Book({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.auther,
    required this.data,
  });

  factory Book.fromjson(Map<String, dynamic> jsonBook) {
    return Book(
      page: jsonBook["page"],
      perPage: jsonBook["per_page"],
      total: jsonBook["total"],
      totalPages: jsonBook["total_pages"],
      auther: jsonBook["author"] !=null 
      ? Auther.fromJson(jsonBook["author"]) 
      : null,
      data: jsonBook["data"] != null 
      ? DataList.fromjson(jsonBook["data"]) 
      : null,
    );
  }
}
