import 'package:flutter/material.dart';
import 'package:mobile_banking/data/data.dart';

import '../components/my_card.dart';

class MyCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("My cards")),
        body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: ((context, index) =>
                MyCard(data: cards[index], isExpanded: false)),
            separatorBuilder: ((context, index) => const SizedBox(height: 16)),
            itemCount: cards.length),
      );
}
