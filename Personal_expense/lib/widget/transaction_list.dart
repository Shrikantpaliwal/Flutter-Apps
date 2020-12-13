import 'package:flutter/material.dart';
import 'package:Personal_expense/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _tnx;
  TransactionList(this._tnx);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._tnx.map((tx) {
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
                  ),
                  child: Text(
                    '\u20B9 ${tx.amount}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      DateFormat('yMEd').format(tx.date),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        }).toList()
      ],
    );
  }
}
