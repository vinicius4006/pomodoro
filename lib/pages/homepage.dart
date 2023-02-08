import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/contador.store.dart';

final store = ContadorStore();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: store.incrementar,
          child: const Icon(Icons.plus_one_rounded)),
      body: Center(
        child: Observer(
            builder: (_) => Text(
                  '${store.contador}',
                  style: const TextStyle(fontSize: 30),
                )),
      ),
    );
  }
}
