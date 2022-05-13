import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/subcategory.dart';

class SubcategoriesWidget extends StatefulWidget {
  final Category selectedCategory;
  final Function sendSubcategoriesInfo;

  const SubcategoriesWidget(
      {Key? key,
      required this.selectedCategory,
      required this.sendSubcategoriesInfo})
      : super(key: key);

  @override
  State<SubcategoriesWidget> createState() => _SubcategoriesWidgetState();
}

class _SubcategoriesWidgetState extends State<SubcategoriesWidget> {
  final List<Subcategory> _selectedSubcategories = [];

  void _updateSelectedSubcategories(Subcategory subcategory) {
    setState(() {
      if (subcategory.isChecked) {
        _selectedSubcategories.add(subcategory);
      } else {
        _selectedSubcategories.remove(subcategory);
      }
      widget.sendSubcategoriesInfo(
          _selectedSubcategories.map((e) => e.name).toList().join(', '));
    });
  }

  void resetSelected() {
    for (var sub in _selectedSubcategories) {
      sub.isChecked = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    resetSelected();
  }

  @override
  Widget build(BuildContext context) {
    print('build Subcategories');

    return SingleChildScrollView(
      child: Container(
        height: 300,
        width: 340,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            '${widget.selectedCategory.name} :',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Column(
            children: widget.selectedCategory.subcategoris.map((s) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: s.isChecked,
                      onChanged: (value) {
                        setState(() {
                          s.isChecked = value!;
                          _updateSelectedSubcategories(s);
                        });
                      }),
                  Text(s.name),
                  const SizedBox(
                    width: 15,
                  )
                ],
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
