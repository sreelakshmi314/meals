import 'package:flutter/material.dart';

class MealsContent extends StatelessWidget {
  const MealsContent(
      {super.key,
      required this.title,
      required this.description,
      this.verticalPadding = 0,
      this.horizontalPadding = 0});

  final String title;
  final List<String> description;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 8),
        for (final details in description)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Text(
              details,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ),
      ],
    );
  }
}
