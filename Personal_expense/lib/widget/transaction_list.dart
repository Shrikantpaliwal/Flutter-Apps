import 'package:flutter/material.dart';
import 'package:Personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _tnx;
  final Function deleteTxnId;
  TransactionList(this._tnx, this.deleteTxnId);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    //color: Theme.of(context).primaryColor
                  ),
                  child: Text(
                    '\u20B9 ${_tnx[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  width: 185,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _tnx[index].title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        DateFormat('yMEd').format(_tnx[index].date),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          onPressed: () => {deleteTxnId(_tnx[index].id)})
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: _tnx.length,
      ),
    );
  }
}
