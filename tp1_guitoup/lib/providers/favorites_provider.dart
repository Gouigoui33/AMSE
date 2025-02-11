import 'package:flutter/material.dart';
import '../models/base.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Base> _favorites = [];

  List<Base> get favorites => _favorites;

  void toggleFavorite(Base base) {
    if (_favorites.contains(base)) {
      _favorites.remove(base);
    } else {
      _favorites.add(base);
    }
    notifyListeners();
  }

  bool isFavorite(Base base) {
    return _favorites.contains(base);
  }
}
