import 'package:flutter/material.dart';

class ShowCaseBox extends StatelessWidget {
  final String title;
  final Color col;
  final double calVal;

  ShowCaseBox({this.title, this.col, this.calVal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      height: 145,
      width: 145,
      // color: Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            child: Text(
              title,
              textScaleFactor: 1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
          FittedBox(
            child: Text(
              calVal.toString(),
              textScaleFactor: 3.5,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: col,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
