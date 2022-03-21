import 'package:expense_tracker/widget/purchase_list.dart';
import 'package:expense_tracker/widget/transaction_textfields.dart';
import 'package:expense_tracker/widget/user_transactions.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('CHART'),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
