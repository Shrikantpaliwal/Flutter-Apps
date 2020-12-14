import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  void doSubmit() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => doSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => doSubmit(),
            ),
            RaisedButton(
              child: Text("Add"),
              onPressed: () {
                doSubmit();
              },
              elevation: 1.5,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
