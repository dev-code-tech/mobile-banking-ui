import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking/components/transaction_card.dart';
import 'package:mobile_banking/data/constants.dart';
import 'package:mobile_banking/data/data.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Transactions")),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: Color(0xffeeeeee),
                thumbColor: accentColor,
                padding: const EdgeInsets.all(8),
                groupValue: groupValue,
                children: {
                  0: _buildSegment("All", groupValue == 0),
                  1: _buildSegment("In", groupValue == 1),
                  2: _buildSegment("Out", groupValue == 2)
                },
                onValueChanged: (value) => setState(() {
                  groupValue = value;
                }),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: ((context, index) =>
                      TransactionCard(data: transaction[index])),
                  separatorBuilder: ((context, index) =>
                      const SizedBox(height: 8)),
                  itemCount: transaction.length))
        ]),
      );

  _buildSegment(String text, bool isSelected) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: isSelected ? 18 : 16,
          color: isSelected ? Colors.white : Colors.black),
    );
  }
}
