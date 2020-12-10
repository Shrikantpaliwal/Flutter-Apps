import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiceState();
  }
}

class DiceState extends State<MyApp> {
  int diceNum = 0;
  void randomGenerate() {
    Random rnd = new Random();
    int dice = rnd.nextInt(6);
    diceNum = 0;
    setState(() {
      diceNum = dice + 1;
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
            Text(diceNum.toString(), style: TextStyle(fontSize: 120)),
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
