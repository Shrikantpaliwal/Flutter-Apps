import 'package:Personal_expense/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 100, date: DateTime.now()),
    Transaction(id: "t2", title: "New GF", amount: 10000, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JamaKharch"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.cyan,
              child: Text("Chart Will go here"),
            ),
          ),
          Card(
            color: Colors.red,
            child: Text("Transactions will go here"),
            elevation: 5,
          )
        ],
      ),
    );
  }
}
