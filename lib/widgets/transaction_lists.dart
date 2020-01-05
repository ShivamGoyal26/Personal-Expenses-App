import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      // child: SingleChildScrollView(    // here to use the single child scroll height should be fixed so where ever you want to use this single child scroll view must wrap widget into the container and set the height then use it as shown here bascially by this we can scroll down or up in case the number of lists increased

      child: ListView.builder(
        itemBuilder: (ctx, index) {
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
                      '\$${transactions[index].amount.toStringAsFixed(2)}', // here this toStringAsFixed(2) will helps us not showing more than two numbers after the decimal point 

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
                        transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ));
        },
        itemCount: transactions.length,
        // here we are using the list view with the builder now here in the builder
        // we have to use the itembuilder : now it will take the one function it must be an anonymous or some
        // named Function now this function will have two arguments one is context here we named it ctx and
        // the other must be index it can not be changed
        //  here the height of the listview is the infinte so there must be a problem of not showing the widgets in the column wise sometimes due to its infinite height that's why you should always use the container while using the listview
        // children: transactions.map((tx) {   // here in the list view we can not provide the children here we have to provide the itemcount which we want to be display or show on the screen

        // here in the itembuilder the function which is anonymous in this case will be excuted automatically
        // as much as the number of the itemcount is there but here it return the widget so here we want to
        // return our card

        // }).toList() // here map() function coverts the list of objects into the list of widgets here at last we add tolist() this is because we know map will give us the iterable so in order to achieve the list we add this
// here we should know that the map pick one by one element in the list
      ),
      // ),
    );
  }
}
