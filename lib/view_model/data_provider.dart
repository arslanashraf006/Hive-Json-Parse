import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../service/service.dart';
import '../models/book_model.dart';

class DataProvider with ChangeNotifier {

  var bookBox = Hive.box<Book>('bookBox');

  Book? bookData;

  Book? get getBook {
    return bookData;
  }

  void setBook(book) {
    bookData = book;
  }

  Future<void> getData() async {
    final data = await Service.loadBook();
    Book book = Book.fromjson(data);
    bookBox.put('book1', book);

    var book1 = bookBox.get('book1');
    setBook(book1);
    notifyListeners();
  }

   deleteHiveData() {
    bookBox.delete('book1');
    setBook(null);
    notifyListeners();
  }
}
