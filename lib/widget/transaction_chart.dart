import 'package:expense_tracker/model/transaction_model.dart';
import 'package:expense_tracker/widget/bar_charts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionChart extends StatelessWidget {
  final List<TransactionModel> recentTransactionList;

  TransactionChart({required this.recentTransactionList});

  List<Map<String, Object>> get groupTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalTransactionAmount = 0.0;

      for (var i = 0; i < recentTransactionList.length; i++) {
        if (recentTransactionList[i].transactionDate.day == weekday.day &&
            recentTransactionList[i].transactionDate.month == weekday.month &&
            recentTransactionList[i].transactionDate.year == weekday.year) {
          totalTransactionAmount += recentTransactionList[i].transactionAmount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 2),
        'amount': totalTransactionAmount,
      };
    }).reversed.toList();
  }

  double get maximumAmountSpent {
    return groupTransactions.fold(0.0, (previousTransVal, chartItem) {
      return previousTransVal + (chartItem['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7.0,
            horizontal: 10,
          ),
          child: Text(
            'Transaction Chart',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 19,
            ),
          ),
        ),
        Card(
          elevation: 6,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom * 5,
            top: 0.5,
          ),
          child: Container(
            margin: const EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: groupTransactions.map((individualChart) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: BarCharts(
                    weekLabel: individualChart['day'].toString(),
                    totalAmountSpent: individualChart['amount'] as double,
                    spendingPercent: maximumAmountSpent == 0.0
                        ? 0.0
                        : (individualChart['amount'] as double) /
                            maximumAmountSpent,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
