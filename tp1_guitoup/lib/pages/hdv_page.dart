import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/base_card.dart';
import '../models/base_model.dart';

class HdvPage extends StatefulWidget {
  final int hdv;

  HdvPage({required this.hdv});

  @override
  _HdvPageState createState() => _HdvPageState();
}

class _HdvPageState extends State<HdvPage> {
  List<BaseModel> bases = [];

  @override
  void initState() {
    super.initState();
    loadBases(); // 🔥 Correction : cette méthode est bien définie
  }

  /// Charge les bases depuis le fichier JSON
  Future<void> loadBases() async {
    String jsonString = await rootBundle.loadString('assets/bases.json');
    List<dynamic> jsonData = json.decode(jsonString);

    setState(() {
      bases = jsonData
          .map((data) => BaseModel.fromJson(data))
          .where((base) => base.hdv == widget.hdv)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HDV ${widget.hdv}')),
      body: bases.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: bases.length,
              itemBuilder: (context, index) {
                return BaseCard(base: bases[index]);
              },
            ),
    );
  }
}
