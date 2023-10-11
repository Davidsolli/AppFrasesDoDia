import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = ['Frase 1', 'frase 2', 'frase 3', 'frase 4'];
  var _frasePadrao = 'Clique no botão abaixo para trocar de frase!';

  void _gerarFrase() {
    var _randomNum = Random().nextInt(_frases.length);
    setState(() {
      _frasePadrao = _frases[_randomNum];
    });
  }

  void _resetarFrase() {
    setState(() {
      _frasePadrao = 'Clique no botão abaixo para trocar de frase!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases do dia'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Text(
                  _frasePadrao,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  wordSpacing: 1,
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      _gerarFrase();
                    },
                    child: Text(
                      "Clique aqui!",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _resetarFrase();
                    },
                    child: Text(
                      "Resetar",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
