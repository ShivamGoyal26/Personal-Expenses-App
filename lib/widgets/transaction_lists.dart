import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deltedTx;

  TransactionList(this.transactions, this.deltedTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
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
          : Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
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
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$${transactions[index].amount}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      onPressed: (){
                        deltedTx(transactions[index].id);
                      },
                      ),
                    ),
                  );
                  // return Card(
                  //     elevation: 5,
                  //     child: Row(
                  //       children: <Widget>[
                  //         Container(
                  //           padding: EdgeInsets.all(10),
                  //           margin: EdgeInsets.symmetric(
                  //             horizontal: 50,
                  //             vertical: 20,
                  //           ),
                  //           decoration: BoxDecoration(
                  //               border: Border.all(
                  //             color: Colors.purple,
                  //             width: 2,
                  //           )),
                  //           child: Text(
                  //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.purple,
                  //             ),
                  //           ),
                  //         ),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             Text(
                  //               transactions[index].title,
                  //               style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             Text(
                  //               DateFormat.yMMMd()
                  //                   .format(transactions[index].date),
                  //               style: TextStyle(
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ));
                },
                itemCount: transactions.length,
              ),
            ),
    );
  }
}
