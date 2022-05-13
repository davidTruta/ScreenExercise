import 'package:flutter/material.dart';
import 'package:screen_exercise/screens/subcategories_screen.dart';
import 'package:screen_exercise/widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  late String categoryInfo;
  late String subcategoriesInfo;

  @override
  Widget build(BuildContext context) {
    void selectedCategory(category) {
      categoryInfo = category.name;
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return SubcategoriesScreen(
          category: category,
        );
      })).then((value) {
        subcategoriesInfo = value ?? "";
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Categories Screen',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: CategoriesWidget(
              selectedCategory: selectedCategory,
            )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    'category': categoryInfo,
                    'subcategories': subcategoriesInfo
                  });
                },
                child: const Text('Apply Categories')),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
