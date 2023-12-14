import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meal,
    // required this.categoryId,
  });

  // final String categoryId;
  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    // final List<Meal> filteredMeals = dummyMeals
    //     .where((meal) => meal.categories.contains(categoryId))
    //     .toList();

    // String categoryTitle = '';
    // for (final category in availableCategories) {
    //   if (category.id == categoryId) {
    //     categoryTitle = category.title;
    //   }
    // }

    Widget activeScreen = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer)),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          )
        ],
      ),
    );

    if (meal.isNotEmpty) {
      activeScreen = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => MealItem(
          mealItem: meal[index],
          onSelectMeal: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => MealDetailScreen(
                  selectedMeal: meal[index],
                ),
              ),
            );
            // selectMeals(context, filteredMeals[index].id);
          },
        ),
      );
    }
    Widget activeWidget = Scaffold(
      body: activeScreen,
    );

    if (title != null) {
      activeWidget = Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: activeScreen,
      );
    }

    return activeWidget;
  }
}

// import 'package:flutter/material.dart';
// import 'package:meals/model/meal.dart';
// import 'package:meals/widgets/meal_item.dart';

// class MealsScreen extends StatelessWidget {
//   const MealsScreen({super.key, required this.meal});

//   final List<Meal> meal;
//   // final String categoryId;

//   @override
//   Widget build(BuildContext context) {
//     Widget activeScreen = Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Uh oh ... nothing here!',
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                   color: Theme.of(context).colorScheme.onPrimaryContainer)),
//           const SizedBox(height: 8),
//           Text(
//             'Try selecting a different category!',
//             style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                 color: Theme.of(context).colorScheme.onPrimaryContainer),
//           )
//         ],
//       ),
//     );

//     if (meal.isNotEmpty) {
//       activeScreen = ListView.builder(
//         itemCount: meal.length,
//         itemBuilder: (ctx, index) => MealItem(
//           mealItem: meal[index],
//         ),
//       );
//     }

//     return activeScreen;
//   }
// }
