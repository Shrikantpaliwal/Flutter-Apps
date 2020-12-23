import 'package:flutter/material.dart';

class NoTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No Transactions to Print"),
          Image.network(
              'https://cdn2.iconfinder.com/data/icons/ecommerce-outline-6/32/Ecommerce-shopping-sale-transaction_21-512.png')
        ],
      ),
    );
  }
}
