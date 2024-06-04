import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key, required this.msg, required this.align});
  final String msg;
  final MainAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        const Icon(
          Icons.check_circle_outlined,
          color: Color.fromARGB(253, 255, 255, 255),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(msg,
            style: const TextStyle(
                decorationThickness: 30,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(251, 254, 254, 254))),
      ],
    ).frosted(
        frostOpacity: 0,
        borderRadius: BorderRadius.circular(10),
        frostColor: Color.fromARGB(255, 0, 6, 11));
  }
}
