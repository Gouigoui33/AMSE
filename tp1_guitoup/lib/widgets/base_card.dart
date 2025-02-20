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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    base.image,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      base.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text('${base.type} - ${base.date}',
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  favoritesProvider.toggleFavorite(base);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
