import 'package:flutter/material.dart';
import 'package:flutter_layouts/features/presentation/pages/ex.dart';
import 'package:flutter_layouts/features/presentation/widgets/card_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Page01')),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          CardHomeWidget(
            titulo: 'Interação',
            descricao: 'Interagindo com algo',
            icone: Icons.snooze_rounded,
            destino: const Ex(),
          ),
        ],
      ),
    );
  }
}
