import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amt;
  final spendingPer;

  ChartBar(this.day, this.amt, this.spendingPer);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(child: Text('\u20B9 ${amt.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              )),
              FractionallySizedBox(
                heightFactor: spendingPer,
                child: Container(
                    decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(day)
      ],
    );
  }
}
