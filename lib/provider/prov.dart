import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  String _locus = '123000';

  get geolocus => _locus;

  locusChanger(String newlocus) {
    print('i was called');
    _locus = newlocus;
    notifyListeners();
  }
}
