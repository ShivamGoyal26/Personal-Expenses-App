import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses App"),
      ),
      body: SingleChildScrollView(
              child: Column(
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
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
