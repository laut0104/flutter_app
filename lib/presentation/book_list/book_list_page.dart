import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/add_book/add_book_page.dart';
import 'book_list_model.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(
            builder: (context, model, child){
              final books = model.books;
              final listTiles = books.map(
                      (book) => ListTile(
                        title: Text(book.title),
                      ),
              ).toList();
              return ListView(children: listTiles,);
            }
        ),
        floatingActionButton: Consumer<BookListModel>(
            builder: (context, model, child){
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async{
                //todo
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchBooks();
              },
            );
          }
        ),
      ),
    );
  }
}