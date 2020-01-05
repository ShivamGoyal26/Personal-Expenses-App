import 'package:flutter/material.dart';
// import './widgets/user_transactions.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_lists.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expense",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'OpenSans',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
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
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(
          newTx); // here we can not write like this  _userTransactions= newTx; because at the upper we declare it the final but with the help of add function we can add the value without changes the address because basically final keyword lock the adress and const lock the values
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        }); // here instead of _ we can use bCtx or any other name
    // this function opens the bottom sheet here it needs a two arguments one is context and other is builder
    // here context: needs a argu and builder function also gives the context
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(
                  context); // here this function needs a context thats why we passed the content here
            },
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Card(
              color: Colors.purple,
              child: Text(
                "Expenses chart",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(
                context); // here this function needs a context thats why we passed the content here
          }),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   // FOR YOUR INFO WE CAN'T USE THE SETSTATE FUNCTION IN THE STATELESS WIDGET AND NEITHER WE CAN CHANGE THE VALUES OF THE VARIBLES NOR DISPLAY ANY CHANGES IN THE USER DISPLAY so here we have to shift for the stateful widget becasue we have to update the ui when user enter there expenses and the input title and amount will changes at every time when the user enter the value
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
