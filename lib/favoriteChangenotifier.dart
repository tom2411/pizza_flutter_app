import 'package:flutter/cupertino.dart';

class FavoriteChangeNotifier with ChangeNotifier{
  bool _isFavorited;
  final int _favoriteCount;

  FavoriteChangeNotifier(this._isFavorited, this._favoriteCount);

  bool get isFavorited => _isFavorited;

  int get favoriteCount => _favoriteCount+ (_isFavorited ? 1 :0);

  set isFavorited(bool value) {
    _isFavorited = value;
    notifyListeners();
  }
}