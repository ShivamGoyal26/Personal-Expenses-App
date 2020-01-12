import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './widgets/chart.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transaction_lists.dart';

void main() {
  print("Void Main()");
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
    print("Stateless widget in the build method");
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
  _MyHomePageState createState() {
    print("Stateful State Class");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(
      String txtitle, double txamount, DateTime pickedDate) {
    print("Add New Transaction");
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: pickedDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
    print("print in after the setstate in the add new transaction");
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
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        print("Delte Transaction in the setstate");
        _userTransactions.removeWhere(
          (tx) {
            return tx.id == id;
          },
        );
      },
    );
    print("Delte Transaction after the setstate");
  }

  List<Transaction> get _recentTransactions {
    print("Recent Transactions");
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  bool _showChart = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // This method calls by the flutter automatically when our app will change its state
  }

  @override
  dispose() {
    super.dispose();
  }

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txList) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show Chart'),
          Switch.adaptive(
            activeColor: Colors.purple,
            value: _showChart,
            onChanged: (val) {
              setState(
                () {
                  _showChart = val;
                },
              );
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              child: Chart(_recentTransactions),
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.5,
            )
          : txList
    ];
  }

  List<Widget> _buildPortraitContent(
    MediaQueryData mediaQuery,
    AppBar appBar,
    Widget txList,
  ) {
    return [
      Container(
        child: Chart(_recentTransactions),
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.22,
      ),
      txList,
    ];
  }

  @override
  Widget build(BuildContext context) {
    print("Main Build Method");
    final mediaQuery = MediaQuery.of(context);
    final isLandsacpe = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              "Personal Expenses",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.add,
                  ),
                  onTap: () {
                    _startAddNewTransaction(context);
                  },
                )
              ],
            ),
          )
        : AppBar(
            title: Text(
              "Personal Expenses",
            ),
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
      child: TransactionList(
        _userTransactions,
        _deleteTransaction,
      ),
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.78,
    );
    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isLandsacpe)
              ..._buildLandscapeContent(
                mediaQuery,
                appBar,
                txList,
              ),
            if (!isLandsacpe)
              ..._buildPortraitContent(
                mediaQuery,
                appBar,
                txList,
              ),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: bodyPage,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _startAddNewTransaction(context);
                    },
                  ),
          );
  }
}
