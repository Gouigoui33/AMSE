import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/base_card.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bases likees')),
      body: favoritesProvider.favorites.isEmpty
          ? Center(child: Text("Aucune base en favori pour l’instant."))
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                return BaseCard(base: favoritesProvider.favorites[index]);
              },
            ),
    );
  }
}
