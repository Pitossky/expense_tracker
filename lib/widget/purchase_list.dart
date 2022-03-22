import 'package:expense_tracker/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseList extends StatelessWidget {
  final List<TransactionModel> purchases;

  PurchaseList({required this.purchases});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      //color: Colors.blue,
      child: purchases.isEmpty ? Column(
        children: [
          Text(
            'Please click the button below to add a Transaction!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: Image.asset(
                'assets/images/waiting.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
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
                      color: Theme.of(context).primaryColor,
                      width: 2,

                    ),
                  ),
                  child: Text(
                    '\$${purchases[index].transactionAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.titleLarge
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
