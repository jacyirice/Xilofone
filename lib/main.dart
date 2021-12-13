import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XilofonePage());
}

class XilofonePage extends StatelessWidget {
  XilofonePage({Key? key}) : super(key: key);

  AudioCache player = AudioCache(prefix: 'assets/audios/');

  List botoes = [
    {'cor': Colors.red, 'som': 'note1.wav'},
    {'cor': Colors.orange, 'som': 'note2.wav'},
    {'cor': Colors.yellow, 'som': 'note3.wav'},
    {'cor': Colors.green, 'som': 'note4.wav'},
    {'cor': Colors.green.shade900, 'som': 'note5.wav'},
    {'cor': Colors.blue, 'som': 'note6.wav'},
    {'cor': Colors.purple, 'som': 'note7.wav'},
  ];
  Expanded criaBotao(Color cor, String som) {
    print(som);
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: cor,
        ),
        child: const Text(''),
        onPressed: () {
          player.play(som);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (Map botao in botoes) criaBotao(botao['cor'], botao['som'])
            ],
          ),
        ),
      ),
    );
  }
}
