import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
      title: 'Los Angeles',
      amount: 60,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Las Vegas',
      amount: 40,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Text("Expenses chart"),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Column(
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

              )
        ],
      ),
    );
  }
}
