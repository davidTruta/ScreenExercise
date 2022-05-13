import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/subcategories_widget.dart';

class SubcategoriesScreen extends StatelessWidget {
  final Category category;
  String subcategoriesInfo = "";

  SubcategoriesScreen({Key? key, required this.category}) : super(key: key);

  setSubcategoriesInfo(newInfo) {
    subcategoriesInfo = newInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Subcategories Screen',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: SubcategoriesWidget(
              selectedCategory: category,
              sendSubcategoriesInfo: setSubcategoriesInfo,
            )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(subcategoriesInfo);
                },
                child: const Text('Apply Subcategory')),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
