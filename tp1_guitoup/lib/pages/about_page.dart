import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cette application permet de découvrir et liker des bases clash of clans selon leur design"
              "en fonction du niveau d'hotel de ville ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "J'ai réalisé ce projet Flutter dans le cadre d'un cours d'initiation  à Flutter",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
