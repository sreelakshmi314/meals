import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/meal_item_spec.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.mealItem,
    required this.onSelectMeal,
  });

  final Meal mealItem;
  final void Function() onSelectMeal;

  String get complexityText {
    return mealItem.complexity.name[0].toUpperCase() +
        mealItem.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealItem.affordability.name[0].toUpperCase() +
        mealItem.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: InkWell(
        onTap: onSelectMeal,
        child: Stack(
          children: [
            Hero(
              tag: mealItem.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealItem.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                child: Column(children: [
                  Text(
                    mealItem.title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemSpec(
                        outputText: '${mealItem.duration} min',
                        outputIcon: Icons.schedule,
                      ),
                      const SizedBox(width: 12),
                      MealItemSpec(
                        outputText: complexityText,
                        outputIcon: Icons.work,
                      ),
                      const SizedBox(width: 12),
                      MealItemSpec(
                        outputText: affordabilityText,
                        outputIcon: Icons.attach_money_rounded,
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
