import 'package:flutter/material.dart';

class BarCharts extends StatelessWidget {
  final String weekLabel;
  final double totalAmountSpent;
  final double spendingPercent;

  BarCharts({
    required this.weekLabel,
    required this.totalAmountSpent,
    required this.spendingPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text('\$${totalAmountSpent.toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          weekLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
