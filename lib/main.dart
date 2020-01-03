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
            children: <Widget>[Card()],
          )
        ],
      ),
    );
  }
}
