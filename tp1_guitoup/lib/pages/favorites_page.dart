import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/base_item.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(title: Text('Bases Likées')),
      body: favorites.isEmpty
          ? Center(child: Text("Aucune base likée."))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return BaseItem(base: favorites[index]);
              },
            ),
    );
  }
}
