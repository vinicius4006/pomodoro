import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function() function;
  const CronometroBotao(
      {super.key,
      required this.texto,
      required this.icone,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            textStyle: const TextStyle(fontSize: 25)),
        onPressed: function,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icone,
                size: 35,
              ),
            ),
            Text(texto)
          ],
        ));
  }
}
