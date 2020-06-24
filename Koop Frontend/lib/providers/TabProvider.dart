import 'package:flutter/material.dart';

//The function of this Tab Provider is to keep track of which "tab" we are currently in/activated
class TabProvider with ChangeNotifier {
  int currentIndex = 0;

  void changeTab(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}