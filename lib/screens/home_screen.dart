import 'package:expense_tracker/widget/purchase_list.dart';
import 'package:expense_tracker/widget/transaction_chart.dart';
import 'package:expense_tracker/widget/transaction_textfields.dart';
import 'package:flutter/material.dart';

import '../model/transaction_model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TransactionModel> _transactionList = [
    /*
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
    TransactionModel(
      transactionId: 't2',
      transactionTitle: 'New Bag',
      transactionAmount: 30.5,
      transactionDate: DateTime.now(),
    ),
    */
  ];

  List<TransactionModel> get recentChartList {
    return _transactionList.where((element) {
      return element.transactionDate.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String addTitle, double addAmount, DateTime datePicked) {
    final newTransaction = TransactionModel(
      transactionId: DateTime.now().toString(),
      transactionTitle: addTitle,
      transactionAmount: addAmount,
      transactionDate: datePicked,
    );

    setState(() {
      _transactionList.add(newTransaction);
    });
  }

  void _transactionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionTextfield(
          addTransactionFunction: _addNewTransaction,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactionList
          .removeWhere((transaction) => transaction.transactionId == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    final appBar = AppBar(
      title: const Text("Expense Tracker"),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (query.size.height -
                      appBar.preferredSize.height -
                      query.padding.top) *
                  0.3,
              child: TransactionChart(
                recentTransactionList: recentChartList,
              ),
            ),
            SizedBox(
              height: (query.size.height -
                      appBar.preferredSize.height -
                      query.padding.top) *
                  0.8,
              child: PurchaseList(
                purchases: _transactionList,
                deleteFnc: _deleteTransaction,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _transactionBottomSheet(context),
        child: const Icon(
          Icons.add,
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
