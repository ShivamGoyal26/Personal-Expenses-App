import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './widgets/chart.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transaction_lists.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.portraitUp,
  //   ], // this is for if you want to disable the the landscape mode on the mobile phone
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expense",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'OpenSans',
        errorColor: Colors.purple,
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
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString()),
    Transaction(
        title: "New shoes",
        date: DateTime.now(),
        amount: 20,
        id: DateTime.now().toString())
  ];

  void _addNewTransaction(
      String txtitle, double txamount, DateTime pickedDate) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: pickedDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
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
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final isLandsacpe =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text("Personal Expenses"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          },
        ),
      ],
    );
    final txList = Container(
      child: TransactionList(_userTransactions, _deleteTransaction),
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.78,
      // MediaQuery.of(context).padding.top // this gives the height of the status bar
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isLandsacpe)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart'),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandsacpe)
              Container(
                child: Chart(_recentTransactions),
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
              ),
            if (!isLandsacpe) txList,
            if (isLandsacpe)
              _showChart
                  ? Container(
                      child: Chart(_recentTransactions),
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                    )
                  : Container(
                      child: TransactionList(
                          _userTransactions, _deleteTransaction),
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      // MediaQuery.of(context).padding.top // this gives the height of the status bar
                    ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          }),
    );
  }
}
