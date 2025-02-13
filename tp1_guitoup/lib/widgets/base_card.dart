import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/base_model.dart';
import '../providers/favorites_provider.dart';

class BaseCard extends StatelessWidget {
  final BaseModel base;

  BaseCard({required this.base});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        bool isFavorite = favoritesProvider.isFavorite(base);

        return Card(
          child: ListTile(
            leading: Image.asset(base.image, width: 50),
            title: Text(base.name),
            subtitle: Text('${base.type} - ${base.date}'),
            trailing: IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null),
              onPressed: () {
                favoritesProvider.toggleFavorite(base);
              },
            ),
          ),
        );
      },
    );
  }
}
