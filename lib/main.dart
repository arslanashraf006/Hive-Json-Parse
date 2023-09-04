import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:parse_json_practise/consts/app_texts.dart';
import 'package:parse_json_practise/models/author_model.dart';
import 'package:parse_json_practise/models/book_model.dart';
import 'package:parse_json_practise/models/data_list_model.dart';
import 'package:parse_json_practise/models/data_model.dart';
import 'package:parse_json_practise/models/images_model.dart';
import './view/home_screen.dart';
import 'package:provider/provider.dart';
import './view_model/data_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  Hive.registerAdapter(AutherAdapter());
  Hive.registerAdapter(DataListAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(ImagesAdapter());
  await Hive.openBox<Book>('bookBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: appNameText,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
