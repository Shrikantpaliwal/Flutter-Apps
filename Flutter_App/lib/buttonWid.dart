import 'package:flutter/material.dart';

class ButtonWid extends StatelessWidget {
  final Function randomGenerate;
  ButtonWid(this.randomGenerate);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Roll The Dice", style: TextStyle(fontSize: 30)),
      onPressed: randomGenerate,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1.5,
      color: Colors.cyan,
    );
  }
}
