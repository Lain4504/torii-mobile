import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class StudySetMatchScreen extends ConsumerStatefulWidget {
  final String setId;
  const StudySetMatchScreen({super.key, required this.setId});

  @override
  ConsumerState<StudySetMatchScreen> createState() => _StudySetMatchScreenState();
}

class _StudySetMatchScreenState extends ConsumerState<StudySetMatchScreen> {
  String? _selectedTermId;
  String? _selectedDefId;
  final Set<String> _matched = {};
  int _moves = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final repo = ref.watch(academyRepositoryProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Match', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: repo.getStudySetMatchGame(widget.setId, count: 6),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Lỗi: ${snap.error}', style: const TextStyle(color: AppColors.error)));
          }
          final pairs = snap.data ?? [];
          if (pairs.isEmpty) {
            return const Center(child: Text('Không tạo được Match', style: TextStyle(color: AppColors.textTertiary)));
          }

          final terms = pairs
              .map((p) => {'id': (p['id'] ?? '').toString(), 'text': (p['term'] ?? '').toString()})
              .toList();
          final defs = pairs
              .map((p) => {'id': (p['id'] ?? '').toString(), 'text': (p['definition'] ?? '').toString()})
              .toList();

          // Shuffle each side to make it a game
          final rng = Random(widget.setId.hashCode ^ pairs.length);
          terms.shuffle(rng);
          defs.shuffle(rng);

          final total = pairs.length;
          final done = _matched.length >= total;

          if (done) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.celebration_rounded, color: AppColors.success, size: 40),
                    ),
                    const SizedBox(height: 14),
                    Text('Tuyệt vời!', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 6),
                    Text(
                      'Bạn đã ghép xong $total cặp • $_moves lượt',
                      style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          _matched.clear();
                          _selectedTermId = null;
                          _selectedDefId = null;
                          _moves = 0;
                        }),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Text('Chơi lại', style: TextStyle(fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          Future<void> tryMatch() async {
            if (_selectedTermId == null || _selectedDefId == null) return;
            final ok = _selectedTermId == _selectedDefId;
            setState(() {
              _moves += 1;
            });
            if (ok) {
              HapticFeedback.lightImpact();
              setState(() {
                _matched.add(_selectedTermId!);
                _selectedTermId = null;
                _selectedDefId = null;
              });
            } else {
              HapticFeedback.heavyImpact();
              await Future.delayed(const Duration(milliseconds: 220));
              if (mounted) {
                setState(() {
                  _selectedTermId = null;
                  _selectedDefId = null;
                });
              }
            }
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${_matched.length}/$total', style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.textSecondary)),
                    Text('Lượt: $_moves', style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: _MatchColumn(
                          title: 'Thuật ngữ',
                          items: terms,
                          matched: _matched,
                          selectedId: _selectedTermId,
                          onSelect: (id) async {
                            if (_matched.contains(id)) return;
                            setState(() => _selectedTermId = id);
                            await tryMatch();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _MatchColumn(
                          title: 'Định nghĩa',
                          items: defs,
                          matched: _matched,
                          selectedId: _selectedDefId,
                          onSelect: (id) async {
                            if (_matched.contains(id)) return;
                            setState(() => _selectedDefId = id);
                            await tryMatch();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Chạm 1 thuật ngữ và 1 định nghĩa để ghép cặp.',
                  style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MatchColumn extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final Set<String> matched;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  const _MatchColumn({
    required this.title,
    required this.items,
    required this.matched,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey300),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              children: [
                Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.grey300),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final id = items[index]['id']!;
                final text = items[index]['text']!;
                final isMatched = matched.contains(id);
                final isSelected = selectedId == id;

                return Opacity(
                  opacity: isMatched ? 0.35 : 1,
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      onPressed: isMatched ? null : () => onSelect(id),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
                        foregroundColor: AppColors.textPrimary,
                        side: BorderSide(
                          color: isSelected ? AppColors.primary.withOpacity(0.55) : AppColors.grey300,
                          width: 1.2,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

