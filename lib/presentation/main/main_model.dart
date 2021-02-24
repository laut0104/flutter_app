import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier{
  String text1 = 'test';

  void changeText(){
    text1 = 'testだよ';
    notifyListeners();
  }
}