import 'package:flutter/material.dart';
import 'bases_by_hdv_page.dart';

class HomePage extends StatelessWidget {
  final List<int> hdvLevels =
      List.generate(14, (index) => index + 3); // HDV 3 à HDV 16

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sélectionnez votre HDV')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 icônes par ligne
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: hdvLevels.length,
        itemBuilder: (context, index) {
          int hdv = hdvLevels[index];
          String imagePath =
              'assets/images/hdv_icons/hdv$hdv.jpg'; // Chemin de l’image HDV

          return GestureDetector(
            onTap: () {
              // Aller à la page des bases de l'HDV sélectionné
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BasesByHdvPage(hdv: hdv)),
              );
            },
            child: Column(
              children: [
                Image.asset(imagePath,
                    width: 80, height: 80), // Affiche l’image
                SizedBox(height: 5),
                Text("HDV $hdv",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
