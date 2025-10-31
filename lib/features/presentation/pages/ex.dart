import 'dart:math';

import 'package:flutter/material.dart';

class Ex extends StatefulWidget {
  const Ex({super.key});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  bool _ligado = false;
  bool _excluir = true;
  String _text = '';
  final TextEditingController _textController = TextEditingController();
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void mostrarTexto() {
    if (_textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'O Campo não pode estar vazio!',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      );
    } else {
      setState(() {
        _text = _textController.text;
        _excluir = true;
      });
    }
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
      body: ListView(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        cursorWidth: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: _ligado
                              ? const Color.fromARGB(97, 255, 214, 64)
                              : const Color.fromARGB(54, 76, 175, 79),
                          labelText: 'Nome',
                          floatingLabelStyle: TextStyle(
                            color: _ligado ? Colors.black : Colors.white,
                          ), // ESTILIZA ELE
                          floatingLabelBehavior: FloatingLabelBehavior
                              .always, // PARA COLOCAR O LABEL PARA APARECER
                          hintText: 'ex: Breno',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(100, 255, 255, 255),
                          ),
                          errorText: null,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            // estilizar bordar quando esta no modo padrão
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: _ligado ? Colors.black : Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            // estilizar bordar quando esta no modo foco
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),

                          suffixIcon: _excluir
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _excluir = false;
                                      _textController.clear();
                                      _text = '';
                                    });
                                  },
                                  icon: Icon(Icons.delete_outline),
                                )
                              : null,
                          suffixIconColor: const Color.fromARGB(
                            181,
                            160,
                            39,
                            31,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
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
