import 'package:Calorie_Calculator/widget/CaloricInfoModel.dart';
import 'package:Calorie_Calculator/widget/ShowCaseBox.dart';
import 'package:flutter/material.dart';

class CaloricWidget extends StatelessWidget {
  final int age; //I know I should have created model
  final double weight;
  final double height;
  final double exerLevel;
  final Gender sex;

  CaloricWidget({this.age, this.weight, this.exerLevel, this.height, this.sex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCaseBox(
                      title: "Maintainance",
                      col: Colors.amber,
                      calVal: 1450.2,
                    ),
                    ShowCaseBox(
                      title: "Fat Loss",
                      col: Colors.lime,
                      calVal: 1450.2,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCaseBox(
                      title: "Extreme FatLoss",
                      col: Colors.lightBlueAccent,
                      calVal: 1450.2,
                    ),
                    ShowCaseBox(
                      title: "Weight Gain",
                      col: Colors.deepOrangeAccent,
                      calVal: 1450.2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
