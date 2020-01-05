import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String titleInput;
  // String amountInput;

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  final Function addTx;

  void submitData() {
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData(),

              // onChanged:                       //here this, this will fired or excute on every key stroke
              // (val) {
              // titleInput = val;               // here we can write anything in the value of val and val always have the string which we have to pas as the arguments to the function here we have used the anonymous function
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountInput,
              keyboardType: TextInputType
                  .number, // this is kind of check now user only can enter the amount in the numbers because it will open the keyboard with the numbers only
              onSubmitted: (_) =>
                  submitData(), // here why we did this right it means when user enter all the values and press the check button on the keyboard then automatically trigger the submit button

              // here it will take the function with the return type void but with the one arguments in the string so here we are using the anonymous function (_){} here in the anonymous function we pass _ this as a argument this means that yes we pass something flutter but we aren't in mood to using it

              // onChanged: (val2) {
              //   amountInput = val2;
              // },
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
