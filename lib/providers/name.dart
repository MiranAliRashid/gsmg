import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String name = "";
  // the variable we want to have access in all screens

  void changeName(String newName) {
    this.name = newName; // to change the value of name
    notifyListeners(); // to let all other widgets that listen to this class be updated
  } //the method to change the value of some variable inside this class

}
