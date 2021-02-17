import 'package:flutter/material.dart';
import 'package:flutter_app/book_list_page.dart';
import 'package:flutter_app/main_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('test'),
          ),
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                    children: [
                      Text(
                        model.text1,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      RaisedButton(
                        child: Text('ボタン'),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookList()),
                          );
                        },
                      ),
                    ],
                  ),
              );
            }
          ),
            ),
      ),
        );
  }
}
