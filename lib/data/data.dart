import 'package:flutter/material.dart';

class SendData {
  final String image;
  final String name;

  SendData(this.image, this.name);
}

enum TransactionType { income, outgo }

class TransactionData {
  final String image;
  final String name;
  final String date;
  final String amount;
  final TransactionType type;

  TransactionData(this.image, this.name, this.date, this.amount, this.type);
}

class CardData {
  final Color background;
  final String image;
  final String date;
  final String amount;
  final String num;

  CardData(this.background, this.image, this.date, this.amount, this.num);
}

final List<CardData> cards = [
  CardData(Colors.purple.withOpacity(0.5), "images/maestro.png", "11/12",
      "1,000,0000", "3241"),
  CardData(Colors.black.withOpacity(0.5), "images/visa.png", "28/11", "500,000",
      "1234"),
  CardData(Colors.green.withOpacity(0.5), "images/paypal.png", "25/12",
      "300,000", "5252"),
  CardData(Colors.red.withOpacity(0.5), "images/discover.png", "30/08",
      "400,000", "2124"),
  CardData(Colors.blue.withOpacity(0.5), "images/apple-pay.png", "02/06",
      "750,000", "5219"),
];

final List<SendData> listProfile = [
  SendData("images/p2.jpg", "Ahmed"),
  SendData("images/p1.jpg", "Ali"),
  SendData("images/p3.jpg", "Duraid"),
  SendData("images/p4.jpg", "Osman"),
  SendData("images/p1.jpg", "Wael"),
  SendData("images/p2.jpg", "Ameer"),
];

final List<TransactionData> transaction = [
  TransactionData(
      "images/p2.jpg", "Ahmed", "2021-01-02", "\$1236", TransactionType.income),
  TransactionData(
      "images/p1.jpg", "Osman", "2021-02-10", "\$3456", TransactionType.outgo),
  TransactionData(
      "images/p4.jpg", "Hasan", "2021-08-02", "\$1236", TransactionType.income),
  TransactionData(
      "images/p2.jpg", "Ameer", "2022-05-02", "\$2346", TransactionType.outgo),
  TransactionData(
      "images/p1.jpg", "Jafar", "2022-11-02", "\$456", TransactionType.income)
];

final List<String> transactionEnum = [
  "Today",
  "This Week",
  "This Month",
  "All Time"
];
