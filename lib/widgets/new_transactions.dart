import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String titleInput;
  // String amountInput;

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
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
              // (val) {
              // titleInput = val;               // here we can write anything in the value of val and val always have the string which we have to pas as the arguments to the function here we have used the anonymous function
              // },
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
                addTx(
                  titleInput.text,
                  double.parse(amountInput.text), // here this will convert the amount in to the double
                );
                // print(titleInput.text);
                // print(amountInput.text);
                // print(titleInput);
                // print(amountInput);
              },
            ),
          ],
        ),
      ),
    );
  }
}
