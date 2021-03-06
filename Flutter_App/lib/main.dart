import 'dart:math';
import 'package:Flutter_App/buttonWid.dart';
import 'package:Flutter_App/questions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiceState();
  }
}

class _DiceState extends State<MyApp> {
  int _diceNum = 0; //_ Prefix Denotes the Private class and properties
  void _randomGenerate() {
    Random rnd = new Random();
    int dice = rnd.nextInt(6);
    _diceNum = 0;
    setState(() {
      _diceNum = dice + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Roll A Dice"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Questions(
              _diceNum.toString(),
            ),
            Align(alignment: Alignment.centerRight),
            ButtonWid(_randomGenerate)
          ],
        ),
      ),
    );
  }
}
