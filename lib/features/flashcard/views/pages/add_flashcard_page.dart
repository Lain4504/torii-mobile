import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../models/flashcard_model.dart';
import '../../providers/flashcard_providers.dart';

class AddFlashcardPage extends ConsumerStatefulWidget {
  final FlashcardDeck deck;
  final Flashcard? cardToEdit;

  const AddFlashcardPage({super.key, required this.deck, this.cardToEdit});

  @override
  ConsumerState<AddFlashcardPage> createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends ConsumerState<AddFlashcardPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _frontController;
  late TextEditingController _backController;
  late TextEditingController _readingController;
  
  bool get _isEditing => widget.cardToEdit != null;

  @override
  void initState() {
    super.initState();
    _frontController = TextEditingController(text: widget.cardToEdit?.front ?? '');
    _backController = TextEditingController(text: widget.cardToEdit?.back ?? '');
    _readingController = TextEditingController(text: widget.cardToEdit?.reading ?? '');
  }

  @override
  void dispose() {
    _frontController.dispose();
    _backController.dispose();
    _readingController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    final front = _frontController.text.trim();
    final back = _backController.text.trim();
    final reading = _readingController.text.trim().isEmpty ? null : _readingController.text.trim();

    bool success;
    if (_isEditing) {
       success = await ref.read(flashcardControllerProvider.notifier).updateCard(
         widget.cardToEdit!.id,
         widget.deck.id,
         front: front,
         back: back,
         reading: reading,
       );
    } else {
       success = await ref.read(flashcardControllerProvider.notifier).addCard(
         widget.deck.id,
         front,
         back,
         reading,
       );
    }

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(_isEditing ? 'Card updated successfully!' : 'Card added successfully!'),
          backgroundColor: AppColors.success,
          duration: const Duration(seconds: 1),
        ),
      );
      
      if (_isEditing) {
        context.pop();
      } else {
        // Clear for next card
        _frontController.clear();
        _backController.clear();
        _readingController.clear();
      }
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
          _isEditing ? 'EDIT CARD' : 'ADD TO ${widget.deck.title}'.toUpperCase(),
          style: const TextStyle(
            fontSize: 12, 
            fontWeight: AppTypography.black, 
            letterSpacing: 1.5, 
            color: AppColors.textTertiary
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: ZenBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildCardPreview(),
                const SizedBox(height: 30),
                
                EntryAnimation(
                  index: 1,
                  child: ZenTextField(
                    label: 'FRONT (QUESTION)',
                    controller: _frontController,
                    hintText: 'e.g. 猫',
                    icon: Icons.flip_to_front_rounded,
                    validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
                  ),
                ),
                const SizedBox(height: 20),
                
                EntryAnimation(
                  index: 2,
                  child: ZenTextField(
                    label: 'READING (OPTIONAL)',
                    controller: _readingController,
                    hintText: 'e.g. Neko',
                    icon: Icons.record_voice_over_rounded,
                  ),
                ),
                const SizedBox(height: 20),

                EntryAnimation(
                  index: 3,
                  child: ZenTextField(
                    label: 'BACK (ANSWER)',
                    controller: _backController,
                    hintText: 'e.g. Cat',
                    icon: Icons.flip_to_back_rounded,
                    validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
                  ),
                ),
                const SizedBox(height: 40),

                EntryAnimation(
                  index: 4,
                  child: ZenButton(
                    text: _isEditing ? 'UPDATE CARD' : 'ADD CARD',
                    onPressed: _submit,
                    isLoading: isLoading,
                    isFullWidth: true,
                    icon: _isEditing ? Icons.save_rounded : Icons.add_card_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return EntryAnimation(
      index: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.05),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: const Text('PREVIEW', style: TextStyle(fontSize: 9, color: AppColors.primary, letterSpacing: 2, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: _frontController,
              builder: (context, val, _) {
                return Text(
                  val.text.isEmpty ? 'Front Text' : val.text,
                  style: TextStyle(
                    fontSize: 32, 
                    fontWeight: AppTypography.black, 
                    color: val.text.isEmpty ? AppColors.grey300 : AppColors.textPrimary,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                );
              },
            ),
            const SizedBox(height: 12),
             ValueListenableBuilder(
              valueListenable: _readingController,
              builder: (context, val, _) {
                if (val.text.isEmpty) return const SizedBox.shrink();
                return Text(
                  val.text,
                  style: const TextStyle(fontSize: 16, color: AppColors.textTertiary, fontWeight: AppTypography.medium),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(height: 8),
            const Divider(height: 32, indent: 40, endIndent: 40),
            ValueListenableBuilder(
              valueListenable: _backController,
              builder: (context, val, _) {
                return Text(
                  val.text.isEmpty ? 'Back Text' : val.text,
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: AppTypography.bold, // Reduced weight for back
                    color: val.text.isEmpty ? AppColors.grey300 : AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
