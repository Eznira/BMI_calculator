/// Bellow are the custom widget i used to build my screens


import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';


class IncrementIcon extends StatelessWidget {
  const IncrementIcon({super.key, required this.ontap});

  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

class DecrementIcon extends StatelessWidget {
  const DecrementIcon({super.key, required this.ontap});

  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: const Icon(
          Icons.remove,
          size: 40,
        ),
      ),
    );
  }
}

class EndButton extends StatelessWidget {
  const EndButton({super.key, required this.displayText, required this.onTap});

  final String displayText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(1),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Center(
            child: Text(
              displayText,
              style: ktext3,
            )),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0E4),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}
