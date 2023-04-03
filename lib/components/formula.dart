import 'package:flutter/material.dart';

class Formula extends StatelessWidget {
  Formula({super.key, required this.texto});

  String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
        color: const Color.fromARGB(255, 224, 224, 224),
        child: Text(
          texto,
          textAlign: TextAlign.end,
          style: const TextStyle(fontSize: 30, color: Colors.black54),
        ),
      ),
    );
  }
}
