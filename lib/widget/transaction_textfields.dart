import 'package:flutter/material.dart';

class TransactionTextfield extends StatelessWidget {
  late final Function addTransactionFunction;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  TransactionTextfield({required this.addTransactionFunction});

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
            ),
            FlatButton(
              onPressed: () {
                addTransactionFunction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
