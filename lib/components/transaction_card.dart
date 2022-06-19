import 'package:flutter/material.dart';
import 'package:mobile_banking/data/data.dart';

class TransactionCard extends StatelessWidget {
  final TransactionData data;

  const TransactionCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) => Card(
        elevation: 1,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(data.image,
                      width: 60, height: 60, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(data.date)
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(data.amount),
                    Icon(
                      data.type == TransactionType.income
                          ? Icons.arrow_circle_up
                          : Icons.arrow_circle_down,
                      color: data.type == TransactionType.income
                          ? Colors.green
                          : Colors.red,
                    )
                  ],
                )
              ],
            )),
      );
}
