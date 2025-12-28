import 'package:flutter/material.dart';

class CourseFilterBar extends StatelessWidget {
  const CourseFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(child: TextField(decoration: InputDecoration(labelText: 'Search courses'))),
          const SizedBox(width: 12),
          DropdownButton<String>(
            value: 'All',
            items: const [DropdownMenuItem(value: 'All', child: Text('All'))],
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

