import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/flashcard_model.dart';
import '../../providers/flashcard_providers.dart';

class AddDeckPage extends ConsumerStatefulWidget {
  final FlashcardDeck? deckToEdit;
  
  const AddDeckPage({super.key, this.deckToEdit});

  @override
  ConsumerState<AddDeckPage> createState() => _AddDeckPageState();
}

class _AddDeckPageState extends ConsumerState<AddDeckPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  
  bool get _isEditing => widget.deckToEdit != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.deckToEdit?.title ?? '');
    _descController = TextEditingController(text: widget.deckToEdit?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final name = _titleController.text.trim();
    final desc = _descController.text.trim();

    bool success;
    if (_isEditing) {
       success = await ref.read(flashcardControllerProvider.notifier).updateDeck(
         widget.deckToEdit!.id,
         name,
         desc,
       );
    } else {
       success = await ref.read(flashcardControllerProvider.notifier).createDeck(
         name,
         desc,
       );
    }

    if (success && mounted) {
      if (_isEditing) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deck updated successfully')));
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(flashcardControllerProvider);
    final isLoading = state.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          _isEditing ? 'EDIT DECK' : 'NEW DECK',
          style: const TextStyle(
            fontSize: 12, 
            fontWeight: AppTypography.black, 
            letterSpacing: 2.0, 
            color: AppColors.textPrimary
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: ZenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                EntryAnimation(
                  index: 0,
                  child: ZenTextField(
                    label: 'DECK TITLE',
                    controller: _titleController,
                    hintText: 'e.g. JLPT N5 Daily',
                    icon: Icons.title_rounded,
                    validator: (val) => (val == null || val.isEmpty) ? 'Title is required' : null,
                  ),
                ),
                const SizedBox(height: 20),
                
                EntryAnimation(
                  index: 1,
                  child: ZenTextField(
                    label: 'DESCRIPTION',
                    controller: _descController,
                    hintText: 'Brief goal of this deck...',
                    icon: Icons.description_outlined,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 40),

                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      state.error.toString(),
                      style: const TextStyle(color: AppColors.error, fontSize: 12),
                    ),
                  ),

                EntryAnimation(
                  index: 2,
                  child: ZenButton(
                    text: _isEditing ? 'UPDATE DECK' : 'CREATE DECK',
                    onPressed: _submit,
                    isLoading: isLoading,
                    isFullWidth: true,
                    icon: _isEditing ? Icons.save_rounded : Icons.add_circle_outline_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
