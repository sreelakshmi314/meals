import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/widgets/switch_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosenFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchList(
            switchValue: chosenFilters[Filter.glutenFree]!,
            outputTitle: 'Gluten-free',
            outputSubTitle: 'Only include gluten-free meals.',
            switchCheck: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),
          SwitchList(
            switchValue: chosenFilters[Filter.vegan]!,
            outputTitle: 'Vegan',
            outputSubTitle: 'Only include vegan meals.',
            switchCheck: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
          SwitchList(
            switchValue: chosenFilters[Filter.vegetarian]!,
            outputTitle: 'Vegetarian',
            outputSubTitle: 'Only include vegetarian meals.',
            switchCheck: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          SwitchList(
            switchValue: chosenFilters[Filter.lactoseFree]!,
            outputTitle: 'Lactose-free',
            outputSubTitle: 'Only include lactose-free meals.',
            switchCheck: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
