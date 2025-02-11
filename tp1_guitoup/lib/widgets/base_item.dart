import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/base.dart';
import '../providers/favorites_provider.dart';

class BaseItem extends StatelessWidget {
  final Base base;

  const BaseItem({Key? key, required this.base}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(base);

    return Card(
      child: ListTile(
        leading: Image.asset(base.image, width: 50, height: 50),
        title: Text(base.name),
        subtitle: Text('${base.type} • ${base.date}'),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            favoritesProvider.toggleFavorite(base);
          },
        ),
      ),
    );
  }
}
