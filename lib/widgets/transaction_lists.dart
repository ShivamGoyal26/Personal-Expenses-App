import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 600,
      child: SingleChildScrollView(    // here to use the single child scroll height should be fixed so where ever you want to use this single child scroll view must wrap widget into the container and set the height then use it as shown here bascially by this we can scroll down or up in case the number of lists increased 

              child: Column(
                  children: transactions.map((tx) {
                return Card(
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )),
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ));
              }).toList() // here map() function coverts the list of objects into the list of widgets here at last we add tolist() this is because we know map will give us the iterable so in order to achieve the list we add this
// here we should know that the map pick one by one element in the list

                  ),
      ),
    );
  }
}
