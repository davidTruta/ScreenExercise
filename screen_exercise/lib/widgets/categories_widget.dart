import 'package:flutter/material.dart';

import '../data.dart';
import '../models/category.dart';
import '../models/subcategory.dart';

class CategoriesWidget extends StatefulWidget {
  final Function selectedCategory;

  const CategoriesWidget({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  Category? _selectedCategory;
  final List<Subcategory> _selectedSubcategories = [];
  final List<Category> _categories = DUMMY_DATA;
  final double _width = 300;

  void _updateSelectedCategories(Category category) {
    setState(() {
      if (category.isChecked) {
        if (_selectedCategory != null) {
          category.isChecked = false;
        } else {
          _selectedCategory = category;
          widget.selectedCategory(category);
        }
      } else {
        _selectedCategory = null;
      }
    });
  }

  void resetCategory() {
    for (var c in _categories) {
      c.isChecked = false;
    }
  }

  @override
  dispose() {
    super.dispose();
    resetCategory();
  }

  Widget buildCategoriesWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 180,
              width: _width,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _categories[index].isChecked,
                        onChanged: (value) {
                          // CHANGE CATEGORY FUNCTION
                          setState(() {
                            _categories[index].isChecked = value!;
                            _updateSelectedCategories(_categories[index]);
                          });
                        },
                      ),
                      Text(_categories[index].name),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  );
                },
                itemCount: _categories.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: _width,
                child: Text(
                    'Selected subcategories: ${_selectedSubcategories.map((e) => e.name).toList().fold("", (previousValue, element) {
                  if (previousValue != null) {
                    return (previousValue as String) + " " + element;
                  } else {
                    return element;
                  }
                })}'),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCategoriesWidget(),
      ],
    );
  }
}
