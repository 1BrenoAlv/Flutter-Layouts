import 'package:flutter/material.dart';

class CardHomeWidget extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final String descricao;
  final Widget destino; 

  const CardHomeWidget({
    super.key,
    required this.titulo,
    required this.icone,
    required this.descricao,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destino),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 6, 140, 218),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, size: 50, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                descricao,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
