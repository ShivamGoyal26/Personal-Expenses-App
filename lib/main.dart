import 'package:flutter/material.dart';
import 'widgets/transaction_lists.dart';
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

class MyHomePage extends StatefulWidget {
  // FOR YOUR INFO WE CAN'T USE THE SETSTATE FUNCTION IN THE STATELESS WIDGET AND NEITHER WE CAN CHANGE THE VALUES OF THE VARIBLES NOR DISPLAY ANY CHANGES IN THE USER DISPLAY so here we have to shift for the stateful widget becasue we have to update the ui when user enter there expenses and the input title and amount will changes at every time when the user enter the value

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String titleInput;
  // String amountInput;

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

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
                    controller: titleInput,
                    // onChanged:                       //here this, this will fired or excute on every key stroke
//                         (val) {
                    //  titleInput = val;               // here we can write anything in the value of val and val always have the string which we have to pas as the arguments to the function here we have used the anonymous function
//                     },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountInput,
                    // onChanged: (val2) {
                    //   amountInput = val2;
                    // },
                  ),
                  FlatButton(
                    child: Text("Add Transaction"),
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleInput.text);
                      print(amountInput.text);
                      // print(titleInput);
                      // print(amountInput);
                    },
                  ),
                ],
              ),
            ),
          ),
          TransactionList(), 
        ],
      ),
    );
  }
}
