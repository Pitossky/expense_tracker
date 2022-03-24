import 'package:expense_tracker/model/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseList extends StatelessWidget {
  final List<TransactionModel> purchases;
  final Function deleteFnc;

  PurchaseList({
    required this.purchases,
    required this.deleteFnc,
  });

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final themeVar = Theme.of(context);

    return purchases.isEmpty
        ? Column(
            children: [
              Text(
                'Please click the button below to add a Transaction!',
                style: themeVar.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: query.width,
                //height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/waiting.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : Column(
          children: [
            Container(
              height: query.height * 0.05,
              //margin: EdgeInsets.only(bottom: 10,),
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'List of Purchases',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: query.height * 0.56,
              child: ListView.builder(
                  itemCount: purchases.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(4.5),
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: themeVar.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: SizedBox(
                          width: query.width * 0.22,
                          child: FittedBox(
                            child: Text(
                              '\$${purchases[index].transactionAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: themeVar.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(purchases[index].transactionTitle,
                          style: themeVar.textTheme.titleLarge),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                          purchases[index].transactionDate,
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: query.width > 450
                          ? FlatButton.icon(
                              onPressed: () =>
                                  deleteFnc(purchases[index].transactionId),
                              icon: const Icon(
                                Icons.delete,
                                //color: Colors.red,
                              ),
                              textColor: Colors.red,
                              label: const Text(
                                'Delete',
                              ),
                            )
                          : SizedBox(
                              width: query.width * 0.25,
                              child: InkWell(
                                onTap: () =>
                                    deleteFnc(purchases[index].transactionId),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    /*
                                    Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    */
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    );
                  },
                ),
            ),
          ],
        );
  }
}
