import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';

class ListProvider with ChangeNotifier {
  List<EbookData> get read => read;

  final List<EbookData> _myList = [];

  List<EbookData> get myList => _myList;

  void addToList(EbookData ebookss){
    _myList.add(ebookss);
    notifyListeners();
  }

  void removeFromList(EbookData ebookss){
    _myList.remove(ebookss);
    notifyListeners();
  }
}