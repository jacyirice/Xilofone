import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XilofonePage());
}

class XilofonePage extends StatelessWidget {
  XilofonePage({Key? key}) : super(key: key);
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  List botoes = [
    {'cor': Colors.red, 'som': 'audios/note1.wav'},
    {'cor': Colors.orange, 'som': 'audios/note2.wav'},
    {'cor': Colors.yellow, 'som': 'audios/note3.wav'},
    {'cor': Colors.green, 'som': 'audios/note4.wav'},
    {'cor': Colors.green.shade900, 'som': 'audios/note5.wav'},
    {'cor': Colors.blue, 'som': 'audios/note6.wav'},
    {'cor': Colors.purple, 'som': 'audios/note7.wav'},
  ];
  Expanded criaBotao(Color cor, String som) {
    print(som);
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: cor,
        ),
        child: const Text(''),
        onPressed: () async {
          int result = await audioPlayer.play(som, isLocal: true);
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
