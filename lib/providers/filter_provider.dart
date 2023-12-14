import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/providers/meals_provider.dart';

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
          Filter.lactoseFree: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter chosenFilter, bool isChecked) {
    state = {
      ...state,
      chosenFilter: isChecked,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);


final filteredMealProvider = Provider((ref) {

  final meals = ref.watch(mealsProvider);
  final chosenFilters = ref.watch(filterProvider);

   return meals.where((meal) {
      if (chosenFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (chosenFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (chosenFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (chosenFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      return true;
    }).toList();
});
