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
  bool toggle = true;

  void _createModelView(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return CaloricInfoModel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: toggle == true
          ? InitialLandingPage(_createModelView)
          : CaloricWidget(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
