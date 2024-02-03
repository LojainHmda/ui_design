import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onSelect;

  CategoryWidget({
    required this.category,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
