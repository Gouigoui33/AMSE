import 'package:flutter/material.dart';
import 'hdv_page.dart';
import 'favorites_page.dart';

class HomePage extends StatelessWidget {
  final List<int> hdvLevels = List.generate(14, (index) => index + 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clash Bases'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: hdvLevels.length,
        itemBuilder: (context, index) {
          int hdv = hdvLevels[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HdvPage(hdv: hdv)),
              );
            },
            child: Column(
              children: [
                Image.asset('assets/images/hdv_icons/hdv$hdv.jpg', height: 200),
                Text('HDV $hdv'),
              ],
            ),
          );
        },
      ),
    );
  }
}
