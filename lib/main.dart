// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main(List<String> args) => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pagina(),
    );
  }
}

class Pagina extends StatelessWidget {
  const Pagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
    );
  }
}
