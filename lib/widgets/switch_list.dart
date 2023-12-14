import 'package:flutter/material.dart';

class SwitchList extends StatelessWidget {
  const SwitchList({
    super.key,
    required this.switchValue,
    required this.outputTitle,
    required this.outputSubTitle,
    required this.switchCheck,
  });

  final bool switchValue;
  final String outputTitle;
  final String outputSubTitle;
  final void Function(bool isCheckValue) switchCheck;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding : const EdgeInsets.only(left: 24, right: 22),
      value: switchValue,
      onChanged: switchCheck,
      title: Text(outputTitle),
      subtitle: Text(outputSubTitle),
    );
  }
}
