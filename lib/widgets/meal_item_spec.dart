import 'package:flutter/material.dart';

class MealItemSpec extends StatelessWidget {
  const MealItemSpec({
    super.key,
    required this.outputText,
    required this.outputIcon,
    this.outputSize = 12,
  });

  final String outputText;
  final double outputSize;
  final IconData outputIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          outputIcon,
          size: 16,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          outputText,
          style: TextStyle(
            color: Colors.white,
            fontSize: outputSize,
          ),
        ),
      ],
    );
  }
}
