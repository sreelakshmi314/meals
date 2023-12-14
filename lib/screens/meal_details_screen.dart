import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/model/meal.dart';
import 'package:meals/providers/favorite_provider.dart';
import 'package:meals/widgets/meals_content.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.selectedMeal,
  });

  final Meal selectedMeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeal.contains(selectedMeal);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteStatus(selectedMeal);
              // onToggleFavorite(selectedMeal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    isAdded
                        ? 'Item marked as favorite'
                        : 'Item no longer a favorite!',
                  ),
                  elevation: 2,
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                ),
              );
            },
            icon: AnimatedSwitcher(
              key: ValueKey(isFavorite),
              duration: const Duration(microseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Hero(
              tag: selectedMeal.id,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            selectedMeal.title,
            textAlign: TextAlign.center,
            softWrap: true,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          MealsContent(
              title: 'Ingredients', description: selectedMeal.ingredients),
          const SizedBox(height: 16),
          MealsContent(
            title: 'Steps',
            description: selectedMeal.steps,
            horizontalPadding: 12,
            verticalPadding: 4,
          )
        ]),
      ),
    );
  }
}
