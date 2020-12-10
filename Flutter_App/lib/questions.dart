import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String que;

  Questions(this.que);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 60.0, right: 60.0, bottom: 40.0, top: 40.0),
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.green,
      child: Text(que, style: TextStyle(fontSize: 120)),
    );
  }
}
