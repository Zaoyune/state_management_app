import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterState extends ChangeNotifier{
  int counter=0;//on met "_" pour indiquer que la variable est déclarer comme privé
  void increment(){
    ++counter;
    notifyListeners();
  }
  void decrement(){
    --counter;
    notifyListeners();
  }
}