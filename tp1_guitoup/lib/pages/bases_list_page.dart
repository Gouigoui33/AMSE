import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/base.dart';
import '../widgets/base_item.dart';

class BasesListPage extends StatefulWidget {
  @override
  _BasesListPageState createState() => _BasesListPageState();
}

class _BasesListPageState extends State<BasesListPage> {
  List<Base> _bases = [];

  @override
  void initState() {
    super.initState();
    _loadBases();
  }

  Future<void> _loadBases() async {
    final String response = await rootBundle.loadString('assets/bases.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      _bases = data.map((json) => Base.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des Bases")),
      body: _bases.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _bases.length,
              itemBuilder: (context, index) {
                return BaseItem(base: _bases[index]);
              },
            ),
    );
  }
}
