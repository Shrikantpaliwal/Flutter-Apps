import 'dart:math';
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
  int _diceNum = 0;
  void randomGenerate() {
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
            RaisedButton(
              child: Text("Roll The Dice", style: TextStyle(fontSize: 30)),
              onPressed: randomGenerate,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1.5,
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}
