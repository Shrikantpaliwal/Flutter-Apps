import 'package:flutter/material.dart';
import 'package:Calorie_Calculator/widget/MyHomePage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorina',
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calorina - Measure Calories for you'),
    );
  }
}
