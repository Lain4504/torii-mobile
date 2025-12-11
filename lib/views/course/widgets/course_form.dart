import 'package:flutter/material.dart';

class CourseForm extends StatelessWidget {
  const CourseForm({
    super.key,
    required this.editingId,
    required this.titleCtrl,
    required this.descCtrl,
    required this.priceCtrl,
    required this.published,
    required this.onPublishedChanged,
    required this.onReset,
  });

  final int? editingId;
  final TextEditingController titleCtrl;
  final TextEditingController descCtrl;
  final TextEditingController priceCtrl;
  final bool published;
  final ValueChanged<bool> onPublishedChanged;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: titleCtrl,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: descCtrl,
          decoration: const InputDecoration(labelText: 'Description'),
          maxLines: 2,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: priceCtrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Price'),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: published,
              onChanged: (v) => onPublishedChanged(v ?? false),
            ),
            const Text('Published'),
            const Spacer(),
            if (editingId != null)
              TextButton(
                onPressed: onReset,
                child: const Text('Cancel edit'),
              ),
          ],
        ),
      ],
    );
  }
}


