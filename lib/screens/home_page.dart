import 'package:flutter/material.dart';
import 'package:mobile_banking/data/constants.dart';
import 'package:mobile_banking/data/data.dart';
import 'package:mobile_banking/screens/my_cards_page.dart';
import 'package:mobile_banking/screens/send_page.dart';

import '../components/transaction_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedFilter = transactionEnum[0];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Welcome Back!"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyCardsPage()));
                },
                child: Icon(Icons.credit_card))
          ],
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _headerUI();
              }
              return TransactionCard(data: transaction[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: transaction.length),
      );

  _headerUI() {
    return Column(
      children: [
        _balanceCard(),
        const SizedBox(height: 16),
        _activitiesWidget(context),
        const SizedBox(height: 16),
        _sendAgainWidget(context),
        const SizedBox(height: 16),
        _transactionWidget()
      ],
    );
  }

  _transactionWidget() {
    return Row(
      children: [
        const Text("Transactions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        TextButton(
            onPressed: () {
              _bottomSheet();
            },
            child: Row(
              children: [
                Text(selectedFilter),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ))
      ],
    );
  }

  _bottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Wrap(children: [
              const Text("Filtered By: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              for (var i = 0; i < transactionEnum.length; i++)
                _bottomSheetCard(transactionEnum[i])
            ]),
          );
        });
  }

  _bottomSheetCard(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = text;
        });
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }

  _sendButton() {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SendPage())),
      child: Column(children: const [
        CircleAvatar(
          backgroundColor: accentColor,
          radius: 30,
          child: Icon(Icons.add, size: 34, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text("Send")
      ]),
    );
  }

  _sendAgainWidget(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Send Again",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _sendButton();
                  }
                  return _sendCard(listProfile[index - 1]);
                },
                separatorBuilder: ((context, index) =>
                    const SizedBox(width: 16)),
                itemCount: listProfile.length + 1))
      ]),
    );
  }

  _sendCard(SendData data) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child:
              Image.asset(data.image, height: 60, width: 60, fit: BoxFit.cover),
        ),
        const SizedBox(height: 10),
        Text(data.name)
      ],
    );
  }

  _activitiesWidget(BuildContext context) {
    return Row(
      children: [
        _activityCard(context, Colors.orange, Icons.send, "Send"),
        const SizedBox(width: 10),
        _activityCard(context, Colors.greenAccent,
            Icons.keyboard_double_arrow_down, "Request"),
        const SizedBox(width: 10),
        _activityCard(context, Colors.deepPurple.withOpacity(0.7),
            Icons.dashboard_customize, "More"),
        const SizedBox(width: 10),
      ],
    );
  }

  _activityCard(
      BuildContext context, Color color, IconData icon, String title) {
    return Container(
      height: 140,
      width: (MediaQuery.of(context).size.width - 32 - 30) / 3,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: color),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black.withOpacity(0.1),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }

  _balanceCard() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: accentColor.withOpacity(0.9)),
          height: 120,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Your Balance",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 18),
              Text(
                "\$ 100,000",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Positioned(
            top: -20,
            left: -20,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(0.2),
            )),
        Positioned(
            bottom: -20,
            right: -20,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(0.2),
            ))
      ],
    );
  }
}
