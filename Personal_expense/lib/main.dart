import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "JamaKharch",
      )),
      body: Column(
        children: [
          Card(
            child: Text("Chart Will go here"),
          ),
          Card(
            child: Text("Transactions will go here"),
          )
        ],
      ),
    );
  }
}
