import 'package:flutter/material.dart';
import 'dart:convert'; // Permet de lire le JSON
import 'package:flutter/services.dart' show rootBundle;
import '../models/base.dart';
import '../widgets/base_item.dart';

class BasesByHdvPage extends StatefulWidget {
  final int hdv;

  const BasesByHdvPage({Key? key, required this.hdv}) : super(key: key);

  @override
  _BasesByHdvPageState createState() => _BasesByHdvPageState();
}

class _BasesByHdvPageState extends State<BasesByHdvPage> {
  List<Base> basesForHdv = [];

  @override
  void initState() {
    super.initState();
    loadBases();
  }

  Future<void> loadBases() async {
    // Charger le JSON
    String data = await rootBundle.loadString('assets/bases.json');
    List<dynamic> jsonResult = json.decode(data);

    // Convertir en liste de bases
    List<Base> allBases =
        jsonResult.map((json) => Base.fromJson(json)).toList();

    // Filtrer par HDV
    setState(() {
      basesForHdv = allBases.where((b) => b.hdv == widget.hdv).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bases HDV ${widget.hdv}")),
      body: basesForHdv.isEmpty
          ? Center(
              child: CircularProgressIndicator()) // Indicateur de chargement
          : ListView.builder(
              itemCount: basesForHdv.length,
              itemBuilder: (context, index) {
                return BaseItem(base: basesForHdv[index]);
              },
            ),
    );
  }
}
