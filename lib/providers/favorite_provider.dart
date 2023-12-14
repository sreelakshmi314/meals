import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      // state.remove(meal);
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // state.add(meal);
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);
