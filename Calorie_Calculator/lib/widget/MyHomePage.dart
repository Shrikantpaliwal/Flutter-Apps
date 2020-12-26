import 'package:Calorie_Calculator/widget/CaloricInfoModel.dart';
import 'package:Calorie_Calculator/widget/CaloricWidget.dart';
import 'package:Calorie_Calculator/widget/InitialLandingPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _toggle = true;

  int _getControllerAge;
  double _getControllerHeight;
  double _getControllerWeight;

  Gender _getGender;
  double _getExcersizeLevel;

  void toggleVal(bool val) {
    setState(() {
      _toggle = val;
    });
  }

  void getPrerequisite(
      {String age,
      String weight,
      String height,
      double exerLevel,
      Gender sex}) {
    _getControllerAge = int.parse(age);
    _getControllerHeight = double.parse(height);
    _getControllerWeight = double.parse(weight);
    _getGender = sex;
    _getExcersizeLevel = exerLevel;
  }

  void _createModelView(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return CaloricInfoModel(toggleVal, getPrerequisite);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _toggle == true
          ? InitialLandingPage(_createModelView)
          : CaloricWidget(
              age: _getControllerAge,
              height: _getControllerHeight,
              weight: _getControllerWeight,
              sex: _getGender,
              exerLevel:
                  _getExcersizeLevel), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
