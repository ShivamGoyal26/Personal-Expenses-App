import 'package:flutter/material.dart';
import '../widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    // here we have the get method in this method at the head we have to write the type of what it yields like here we need a need so that we can plot the graph dynamically
    return List.generate(7, (index) {
      // in the get body we have to return that list which it will yield
      // in order to generator a new list we used the generator constructor in the list class here it will take the two arguments first is length and other is generator here we have given the length 7 because we want the 7 days and generator is the function which will be called on every call and this function will recives the index as a argument in this case from 0 to 6
      // means here it will gives us the list of 7
      // here index will run 7 times with the values from 0 to 6
      final weekDay = DateTime.now().subtract(Duration(
          days: index)); // here it will give us the date of last 7 days
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(
            weekDay).substring(0,1), // here it will return the shortcut of the week day
        'amount': totalSum,
      };
    });
  }

double get totalSpending {
return groupedTransactionValues.fold(0.0, (sum, item)   // sum = 0.0  flod will go to every single element in the list
{
return sum + item['amount'];
},
);
}
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          ChartBar(data['day'], data['amount'], totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
