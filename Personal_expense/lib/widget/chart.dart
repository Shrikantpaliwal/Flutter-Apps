import 'package:Personal_expense/models/transaction.dart';
import 'package:Personal_expense/widget/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTx;
  Chart(this.recentTx);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(new Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < recentTx.length; i++) {
        if (recentTx[i].date.day == weekDay.day &&
            recentTx[i].date.month == weekDay.month &&
            recentTx[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTx[i].amount;
        }
      }
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'Amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sumOf, ele) {
      return sumOf + ele['Amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: groupTransactionValues.map((dt) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(dt['Day'], dt['Amount'],
                    (dt['Amount'] as double) / totalSpending),
              );
            }).toList()),
      ),
    );
  }
}
