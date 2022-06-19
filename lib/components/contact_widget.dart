import 'package:flutter/material.dart';
import 'package:mobile_banking/data/data.dart';

class ContactWidget extends StatelessWidget {
  final SendData data;

  const ContactWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Image.asset(
          data.image,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      );
}
