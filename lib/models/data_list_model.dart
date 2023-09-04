import 'package:hive/hive.dart';

import './data_model.dart';
part 'adaptors/data_list_model.g.dart';

@HiveType(typeId: 2)
class DataList {
  @HiveField(0)
  List<Data> dataList;

  DataList({
    required this.dataList,
  });

  factory DataList.fromjson(List<dynamic> jsondata) {
    List<Data> listData = jsondata.map((data) => Data.fromJson(data)).toList();

    return DataList(
      dataList: listData,
    );
  }
}
