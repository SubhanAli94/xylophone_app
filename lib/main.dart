import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});
  final List<Tone> entries = <Tone>[
    Tone('note1.wav', Colors.red),
    Tone('note2.wav', Colors.yellow),
    Tone('note3.wav', Colors.green),
    Tone('note4.wav', Colors.purple),
    Tone('note5.wav', Colors.cyan),
    Tone('note6.wav', Colors.orange),
    Tone('note7.wav', Colors.brown),
  ];
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) => TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                player.play(entries[index].fileName);
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: entries[index].colorName,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Tone {
  String fileName;
  Color colorName;

  Tone(this.fileName, this.colorName);
}
