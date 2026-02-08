import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/ticket_model.dart';
import '../../data/models/create_ticket_dto.dart';
import '../../providers/ticket_providers.dart';

class CreateTicketDialog extends ConsumerStatefulWidget {
  const CreateTicketDialog({super.key});

  @override
  ConsumerState<CreateTicketDialog> createState() => _CreateTicketDialogState();
}

class _CreateTicketDialogState extends ConsumerState<CreateTicketDialog> {
  final _formKey = GlobalKey<FormState>();
  TicketType _selectedType = TicketType.SUPPORT;
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _courseIdController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    _courseIdController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic>? metadata;
      if (_selectedType == TicketType.REFUND) {
        metadata = {'courseId': _courseIdController.text.trim()};
      }

      final dto = CreateTicketDTO(
        type: _selectedType,
        subject: _subjectController.text,
        description: _descriptionController.text,
        metadata: metadata,
      );

      final success = await ref.read(createTicketProvider.notifier).createTicket(dto);

      if (success && mounted) {
        Navigator.pop(context); // Close dialog
        ref.read(ticketListProvider.notifier).refresh(); // Refresh list
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gửi yêu cầu thành công')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final createFooterState = ref.watch(createTicketProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                        'Tạo yêu cầu hỗ trợ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close)),
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<TicketType>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Loại yêu cầu',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                  items: TicketType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.label),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedType = value;
                      });
                    }
                  },
                ),
                if (_selectedType == TicketType.REFUND) ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _courseIdController,
                    decoration: const InputDecoration(
                      labelText: 'Mã khóa học',
                      border: OutlineInputBorder(),
                      helperText: 'Bắt buộc nếu yêu cầu hoàn tiền',
                    ),
                    validator: (value) {
                      if (_selectedType == TicketType.REFUND && (value == null || value.isEmpty)) {
                        return 'Vui lòng nhập mã khóa học';
                      }
                      return null;
                    },
                  ),
                ],
                const SizedBox(height: 16),
                TextFormField(
                  controller: _subjectController,
                  decoration: const InputDecoration(
                    labelText: 'Tiêu đề',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tiêu đề';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Mô tả',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mô tả';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                if (createFooterState.error != null)
                   Padding(
                     padding: const EdgeInsets.only(bottom: 16.0),
                     child: Text(
                      createFooterState.error!,
                      style: const TextStyle(color: Colors.red),
                                       ),
                   ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: createFooterState.isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: createFooterState.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('Gửi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
