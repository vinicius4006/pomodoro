import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro_botao.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PomodoroStore>();
    return Observer(
        builder: (_) => Container(
              color: store.estaTrabalhando() ? Colors.red : Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.estaTrabalhando()
                        ? 'Hora de Trabalhar'
                        : 'Hora de Descansar',
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${store.minutos.toString().padLeft(2, '0')}:${(store.segundos.toString().padLeft(2, '0'))}',
                    style: const TextStyle(fontSize: 120, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !store.iniciado,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CronometroBotao(
                            texto: 'Iniciar',
                            icone: Icons.play_arrow_rounded,
                            function: store.iniciar,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: store.iniciado,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CronometroBotao(
                            texto: 'Parar',
                            icone: Icons.stop_circle_rounded,
                            function: store.parar,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CronometroBotao(
                            texto: 'Reniciar',
                            icone: Icons.refresh_rounded,
                            function: store.reiniciar),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
