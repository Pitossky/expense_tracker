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
    final query = MediaQuery.of(context).size;
    final themeVar = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: query.height * 0.03,
          child: FittedBox(
            child: Text(
              '\$${totalAmountSpent.toStringAsFixed(0)}',
              style: themeVar.textTheme.titleLarge,
            ),
          ),
        ),
        SizedBox(
          height: query.height * 0.005,
        ),
        SizedBox(
          height: query.height * 0.09,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                  color: const Color.fromRGBO(
                    220,
                    220,
                    220,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeVar.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: query.height * 0.005,
        ),
        SizedBox(
          height: query.height * 0.027,
          child: FittedBox(
            child: Text(
              weekLabel,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
