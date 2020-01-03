import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'going to los angeles',
      amount: 60000.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'going to las vegas',
      amount: 6000.0,
      date: DateTime.now(),
    )
  ]; // here <Transaction> this is used as the type of the list
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Text("Expenses chart"),
              elevation: 5,
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
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
                    color: Colors.blue,
                    width: 2,
                  )),
                  child: Text(
                    tx.amount.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(tx.title),
                    Text(tx.date.toString()),
                  ],
                )
              ],
            ));
          }).toList() // here map() function coverts the list of objects into the list of widgets here at last we add tolist() this is because we know map will give us the iterable so in order to achieve the list we add this
// here we should know that the map pick one by one element in the list

              )
        ],
      ),
    );
  }
}
