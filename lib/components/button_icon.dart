import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class ButtonIcon extends StatelessWidget {
  final void Function()? function;
  final IconData iconData;

  const ButtonIcon({super.key, required this.function, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PomodoroStore>();
    return Observer(
      builder: (_) => ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor:
                store.estaTrabalhando() ? Colors.red : Colors.green,
            padding: const EdgeInsets.all(15)),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
