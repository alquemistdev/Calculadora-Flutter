import 'package:flutter/material.dart';
import 'package:calculadora/components/formula.dart';
import 'package:calculadora/components/teclado.dart';
import 'package:calculadora/model/expressao.dart';

class Visor extends StatefulWidget {
  const Visor({super.key});

  @override
  State<Visor> createState() => _VisorState();
}

class _VisorState extends State<Visor> {
  String texto = '';

  editar(String entrada) {
    setState(() {
      switch (entrada) {
        case 'AC':
          texto = '';
          break;
        case '←':
          if (texto.isNotEmpty) texto = texto.substring(0, texto.length - 1);
          break;
        case '=':
          texto = Expressao(dado: texto).toString();
          break;
        default:
          texto += entrada;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Formula(texto: texto)),
          Teclado(texto: texto, pressionar: editar)
        ]);
  }
}
