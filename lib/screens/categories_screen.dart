import 'package:flutter/material.dart';
import 'package:meals/data/meals_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeal,
  });

  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, String categoryId) {
    String mealTitle = '';
    for (final category in availableCategories) {
      if (category.id == categoryId) {
        mealTitle = category.title;
      }
    }
    List<Meal> filteredMeals = widget.availableMeal
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          // categoryId: categoryId,
          title: mealTitle,
          meal: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGrid(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category.id);
                },
              ),
          ],
        ),
        builder: (context, child) =>
            // SlideTransition(
            //   position: _animationController.drive(
            //     Tween(
            //       begin: const Offset(0, 0),
            //       end: const Offset(0, 0),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                top: 100 - _animationController.value * 100,
              ),
              child: child,
            )
        // SlideTransition(
        //   position: Tween(
        //     begin: const Offset(0, 0.3),
        //     end: const Offset(0, 0),
        //   ).animate(
        //     CurvedAnimation(
        //       parent: _animationController,
        //       curve: Curves.easeInOut,
        //     ),
        //   ),
        // ),
        );
  }
}
