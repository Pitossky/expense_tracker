import 'package:expense_tracker/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseList extends StatelessWidget {
  final List<TransactionModel> purchases;

  PurchaseList({required this.purchases});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      //color: Colors.blue,
      child: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (_, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    '\$${purchases[index].transactionAmount}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        purchases[index].transactionTitle,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd()
                          .format(purchases[index].transactionDate),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
