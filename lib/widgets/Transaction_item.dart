import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';


class Transactionitem extends StatelessWidget {
  const Transactionitem({
    Key key,
    @required this.transaction,
    @required this.deltedTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deltedTx;

  @override
  Widget build(BuildContext context) {
    print("Transaction item Build Method");
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: const Icon(
                  Icons.delete,
                ),
                label: const Text("Delete"),
                textColor: Theme.of(context).errorColor,
                onPressed: () {
                  deltedTx(transaction.id);
                })
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  deltedTx(transaction.id);
                },
              ),
      ),
    );
  }
}
