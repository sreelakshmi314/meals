import 'package:flutter/material.dart';
import 'package:meals/providers/favorite_provider.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = ref.watch(filteredMealProvider);
    var activeTitle = 'Categories';

    Widget activeScreen = CategoriesScreen(
      availableMeal: availableMeal,
    );

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealsScreen(
        meal: favoriteMeals,
      );
      activeTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.onBackground,
        unselectedIconTheme: const IconThemeData(size: 20),
        elevation: 5,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            label: '',
            activeIcon: Icon(Icons.set_meal),
            icon: Icon(Icons.set_meal_outlined),
          ),
          BottomNavigationBarItem(
              label: 'Favorites',
              activeIcon: Icon(Icons.star),
              icon: Icon(Icons.star_border)),
        ],
      ),
    );
  }
}
