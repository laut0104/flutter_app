import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/book.dart';

class BookListModel extends ChangeNotifier{
  List<Book> books = [];

  Future fetchBooks() async {
    final docs =
      await FirebaseFirestore.instance.collection('books').get();
    final books = docs.docs.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    notifyListeners();
  }
}