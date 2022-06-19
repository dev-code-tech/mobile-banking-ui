import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking/components/my_card.dart';
import 'package:mobile_banking/data/constants.dart';
import 'package:mobile_banking/data/data.dart';

import '../components/contact_widget.dart';

class SendPage extends StatefulWidget {
  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  SendData selectedPerson = listProfile[0];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Send")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 24),
            _slider(),
            const SizedBox(height: 24),
            _peopleSlider(),
            const SizedBox(height: 16),
            Text("To ${selectedPerson.name}", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            _priceInput(),
            const SizedBox(height: 32),
            _sendButton()
          ],
        )),
      );

  _sendButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
          onPressed: () {},
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(accentColor),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50))),
          child: Text(
            "Send",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }

  _priceInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              _textField(),
              TextButton(onPressed: () {}, child: Text("Change Currency?"))
            ]),
          ),
        ),
      ),
    );
  }

  _textField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          hintText: "Enter Amount",
          prefixIcon: const Icon(Icons.money_sharp),
          suffixIcon: const Icon(Icons.monetization_on, color: Colors.amber),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none)),
    );
  }

  _peopleSlider() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: listProfile.length,
          itemBuilder: (context, index, i) =>
              ContactWidget(data: listProfile[index]),
          options: CarouselOptions(
              onPageChanged: (index, reason) => setState(() {
                    selectedPerson = listProfile[index];
                  }),
              enlargeCenterPage: true,
              aspectRatio: 3,
              viewportFraction: 0.18)),
    );
  }

  _slider() {
    return CarouselSlider.builder(
        itemCount: cards.length,
        itemBuilder: (context, index, i) =>
            MyCard(data: cards[index], isExpanded: true),
        options: CarouselOptions(
            enlargeCenterPage: true, aspectRatio: 2.2, viewportFraction: 0.8));
  }
}
