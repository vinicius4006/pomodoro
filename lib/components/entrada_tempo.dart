import 'package:flutter/material.dart';
import 'package:pomodoro/components/button_icon.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? incrementar;
  final void Function()? decrementar;
  const EntradaTempo(
      {super.key,
      required this.titulo,
      required this.valor,
      required this.incrementar,
      required this.decrementar});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PomodoroStore>();
    return Column(
      children: [
        Text(titulo, style: const TextStyle(fontSize: 25)),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonIcon(
                function: decrementar, iconData: Icons.arrow_downward_rounded),
            Text(
              '$valor min',
              style: const TextStyle(fontSize: 18),
            ),
            ButtonIcon(
                function: incrementar, iconData: Icons.arrow_upward_rounded),
          ],
        )
      ],
    );
  }
}
