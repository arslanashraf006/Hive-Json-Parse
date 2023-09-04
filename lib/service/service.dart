import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Service {
   static Future<String> _loadJsonBook () async{
      return await rootBundle.loadString('assets/book.json');
    }


  static  Future<dynamic> loadBook() async{
      String jsonString = await _loadJsonBook();
      final decodedData = json.decode(jsonString);
      return decodedData;
      
    }
}