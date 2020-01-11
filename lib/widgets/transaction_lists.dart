import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './Transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deltedTx;

  TransactionList(
    this.transactions,
    this.deltedTx,
  );

  @override
  Widget build(BuildContext context) {
      print("Transaction List Build Method");
    return transactions.isEmpty
        ? Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No Transactions Added Yet!",
                ),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Transactionitem(
                transaction: transactions[index],
                deltedTx: deltedTx,
              );
            },
            itemCount: transactions.length,
          );
  }
}
