import 'package:Personal_expense/widget/new_transaction.dart';
import 'package:Personal_expense/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: "OpenSans"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //String titleInput;
  //String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 100, date: DateTime.now()),
    Transaction(id: "t2", title: "PavBhaji", amount: 150, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final Transaction newTx = Transaction(
        id: DateTime.now().toIso8601String(),
        amount: txAmount,
        title: txTitle,
        date: DateTime.now());

    setState(() {
      _transaction.add(newTx);
    });
  }

  void _showNewTransactionModel(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JamaKharch"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _showNewTransactionModel(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.cyan,
                child: Text("Chart Will go here"),
              ),
            ),
            TransactionList(_transaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1.5,
        onPressed: () {
          _showNewTransactionModel(context);
        },
      ),
    );
  }
}
