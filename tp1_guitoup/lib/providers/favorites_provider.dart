import 'package:flutter/material.dart';
import '../models/base_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<BaseModel> _favorites = [];

  List<BaseModel> get favorites => _favorites;

  void toggleFavorite(BaseModel base) {
    if (isFavorite(base)) {
      _favorites.removeWhere((b) => b.name == base.name);
    } else {
      _favorites.add(base);
    }
    notifyListeners();
  }

  bool isFavorite(BaseModel base) {
    return _favorites.any((b) => b.name == base.name);
  }
}
