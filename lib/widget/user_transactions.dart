import 'package:expense_tracker/widget/purchase_list.dart';
import 'package:expense_tracker/widget/transaction_textfields.dart';
import 'package:flutter/material.dart';

import '../model/transaction_model.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<TransactionModel> _transactionList = [
    TransactionModel(
      transactionId: 't1',
      transactionTitle: 'New Shoes',
      transactionAmount: 70.5,
      transactionDate: DateTime.now(),
    ),
    TransactionModel(
      transactionId: 't2',
      transactionTitle: 'New Bag',
      transactionAmount: 30.5,
      transactionDate: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String addTitle, double addAmount){
    final newTransaction = TransactionModel(
        transactionId: DateTime.now().toString(),
        transactionTitle: addTitle,
        transactionAmount: addAmount,
        transactionDate: DateTime.now(),
    );

    setState(() {
      _transactionList.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionTextfield(
            addTransactionFunction: _addNewTransaction,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: const Text(
            'List of Purchases',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PurchaseList(
          purchases: _transactionList,
        ),
      ],
    );
  }
}
