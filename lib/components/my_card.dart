import 'package:flutter/material.dart';
import 'package:mobile_banking/data/data.dart';

import '../screens/transactions_page.dart';

class MyCard extends StatelessWidget {
  final CardData data;
  final bool isExpanded;

  const MyCard({super.key, required this.data, required this.isExpanded});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TransactionPage())),
        child: Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              color: data.background, borderRadius: BorderRadius.circular(16)),
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(data.image, height: 70, width: 70),
                    const Spacer(),
                    Text(
                      data.date,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                isExpanded ? const Spacer() : const SizedBox(height: 16),
                Text("\$${data.amount}", style: TextStyle(fontSize: 18)),
                isExpanded ? const Spacer() : const SizedBox(height: 16),
                Text(
                  "**** **** **** ${data.num}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ]),
            ),
          ),
        ),
      );
}
