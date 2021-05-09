import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  void transactionSubmitHandler() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            // onChanged: (val) => titleInput = val,
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            // onChanged: (val) => amountInput = val,
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => transactionSubmitHandler(),
          ),
          FlatButton(
            onPressed: transactionSubmitHandler,
            child: Text('Add Transaction'),
            textColor: Colors.purple,
          )
        ],
      ),
    );
  }
}
