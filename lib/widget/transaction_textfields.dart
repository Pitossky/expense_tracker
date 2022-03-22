import 'package:flutter/material.dart';

class TransactionTextfield extends StatefulWidget {
  late final Function addTransactionFunction;
  TransactionTextfield({required this.addTransactionFunction});

  @override
  State<TransactionTextfield> createState() => _TransactionTextfieldState();
}

class _TransactionTextfieldState extends State<TransactionTextfield> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void submitTransaction(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransactionFunction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Transaction Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Transaction Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              onPressed: submitTransaction,
              child: const Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
