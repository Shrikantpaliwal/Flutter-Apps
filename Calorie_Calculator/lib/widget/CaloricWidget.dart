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

  double calcCalorie() {
    double mainC;
    if (sex == Gender.Male) {
      mainC = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      mainC = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    return mainC;
  }

  @override
  Widget build(BuildContext context) {
    double maintain = 0;
    maintain = calcCalorie();
    maintain *= exerLevel;
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
                      calVal: maintain,
                    ),
                    ShowCaseBox(
                      title: "Fat Loss",
                      col: Colors.lime,
                      calVal: (maintain - maintain * 0.2),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCaseBox(
                      title: "Extreme FatLoss",
                      col: Colors.lightBlueAccent,
                      calVal: (maintain - maintain * 0.4),
                    ),
                    ShowCaseBox(
                      title: "Weight Gain",
                      col: Colors.deepOrangeAccent,
                      calVal: (maintain + maintain * 0.2),
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
