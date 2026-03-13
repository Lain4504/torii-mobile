import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/widgets/widgets.dart';
import '../../providers/study_providers.dart';

class MatchGamePage extends ConsumerStatefulWidget {
  final String setId;
  const MatchGamePage({super.key, required this.setId});

  @override
  ConsumerState<MatchGamePage> createState() => _MatchGamePageState();
}

class _MatchGamePageState extends ConsumerState<MatchGamePage> {
  late List<_MatchItem> _items;
  int? _selectedIndex;
  int _matchesFound = 0;
  Timer? _timer;
  int _seconds = 0;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _setupGame();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _setupGame() {
    final studySets = ref.read(studySetsProvider).value;
    final set = studySets?.firstWhere((s) => s.id == widget.setId);
    if (set == null || set.setCards == null) return;

    // Pick 6 random cards if more than 6, otherwise take all
    final cards = [...set.setCards!];
    cards.shuffle();
    final selectedCards = cards.take(6).toList();

    _items = [];
    for (var card in selectedCards) {
      _items.add(_MatchItem(text: card.term, cardId: card.id, isTerm: true));
      _items.add(_MatchItem(text: card.definition, cardId: card.id, isTerm: false));
    }
    _items.shuffle();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _handleTap(int index) {
    if (_items[index].isMatched || _selectedIndex == index) return;

    if (_selectedIndex == null) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      final first = _items[_selectedIndex!];
      final second = _items[index];

      if (first.cardId == second.cardId && first.isTerm != second.isTerm) {
        // Match!
        setState(() {
          _items[_selectedIndex!].isMatched = true;
          _items[index].isMatched = true;
          _selectedIndex = null;
          _matchesFound++;
          if (_matchesFound == 6) {
             _timer?.cancel();
             _isGameOver = true;
          }
        });
      } else {
        // No match
        setState(() {
           _items[_selectedIndex!].isError = true;
           _items[index].isError = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(() {
              for (var item in _items) {
                item.isError = false;
              }
              _selectedIndex = null;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'TIME: ${_formatTime(_seconds)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: AppTypography.black,
            fontFamily: AppTypography.fontFamilySerif,
          ),
        ),
        centerTitle: true,
      ),
      body: _isGameOver ? _buildResult() : _buildGrid(),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.xl),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        final isSelected = _selectedIndex == index;

        return GestureDetector(
          onTap: () => _handleTap(index),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: item.isMatched ? 0 : 1,
            child: Container(
              decoration: BoxDecoration(
                color: item.isMatched 
                    ? Colors.transparent 
                    : (item.isError ? AppColors.errorLight : (isSelected ? AppColors.primarySurface : AppColors.white)),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(
                  color: isSelected 
                      ? AppColors.primary 
                      : (item.isError ? AppColors.error : AppColors.grey200.withValues(alpha: 0.5)),
                  width: 2,
                ),
                boxShadow: isSelected ? [] : AppElevation.softShadow,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: item.isTerm ? 18 : 14,
                      fontWeight: AppTypography.bold,
                      fontFamily: item.isTerm ? AppTypography.fontFamilyJapanese : AppTypography.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResult() {
     return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
            const Icon(Icons.emoji_events_rounded, color: AppColors.warning, size: 80),
            const SizedBox(height: 24),
            const Text(
              'XUẤT SẮC!',
              style: TextStyle(fontSize: 32, fontWeight: AppTypography.black),
            ),
            const SizedBox(height: 8),
            Text(
              'Bạn đã ghép cặp thành công trong ${_formatTime(_seconds)}',
              style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 48),
            AppButton(
              onPressed: () => context.pop(),
              text: 'QUAY LẠI',
              width: 200,
            ),
         ],
       ),
     );
  }

  String _formatTime(int seconds) {
    final mins = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }
}

class _MatchItem {
  final String text;
  final String cardId;
  final bool isTerm;
  bool isMatched;
  bool isError;

  _MatchItem({
    required this.text,
    required this.cardId,
    required this.isTerm,
    this.isMatched = false,
    this.isError = false,
  });
}
