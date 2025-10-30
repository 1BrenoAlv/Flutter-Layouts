import 'package:flutter/material.dart';

class Ex extends StatefulWidget {
  const Ex({super.key});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  bool _ligado = false;
  String _text = '';
  final TextEditingController _textController = TextEditingController();

  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void mostrarTexto() {
    setState(() {
      _text = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _ligado ? Colors.green : Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: Center(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined),
          ),
        ),
        title: Text('Page Interação'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Fazendo Interação com Switch (Liga/Desliga)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _ligado
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : Colors.white,
                  ),
                ),
                Switch(
                  value: _ligado,
                  onChanged: (bool newValue) {
                    print('novo é $newValue');
                    setState(() {
                      _ligado = newValue;
                    });
                  },
                  activeColor: Colors.black,
                ),
              ],
            ),
          ),
          Divider(height: 10, color: Colors.black, thickness: 2),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Digite seu nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    mostrarTexto();
                  },
                  child: Text("Aperte pai"),
                ),
                Text(_text, style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
          Divider(height: 10, color: Colors.black, thickness: 2),
        ],
      ),
    );
  }
}
