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

  bool _loading = true;
  Object? _loadError;
  List<Map<String, String>> _terms = [];
  List<Map<String, String>> _defs = [];
  int _pairCount = 0;

  @override
  void initState() {
    super.initState();
    _loadMatchData();
  }

  Future<void> _loadMatchData() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final repo = ref.read(academyRepositoryProvider);
      final pairs = await repo.getStudySetMatchGame(widget.setId, count: 6);
      if (!mounted) return;
      if (pairs.isEmpty) {
        setState(() {
          _loading = false;
          _pairCount = 0;
        });
        return;
      }
      final rng = Random(widget.setId.hashCode ^ pairs.length);
      final terms = pairs
          .map((p) => {'id': (p['id'] ?? '').toString(), 'text': (p['term'] ?? '').toString()})
          .toList();
      final defs = pairs
          .map((p) => {'id': (p['id'] ?? '').toString(), 'text': (p['definition'] ?? '').toString()})
          .toList();
      terms.shuffle(rng);
      defs.shuffle(rng);
      setState(() {
        _terms = terms;
        _defs = defs;
        _pairCount = pairs.length;
        _matched.clear();
        _selectedTermId = null;
        _selectedDefId = null;
        _moves = 0;
        _loading = false;
      });
    } catch (e, st) {
      if (!mounted) return;
      setState(() {
        _loadError = e;
        _loading = false;
      });
      debugPrint('StudySetMatch load: $e\n$st');
    }
  }

  /// Xáo lại thứ tự hai cột từ cùng bộ cặp đã tải — không gọi API lại.
  void _shuffleAgain() {
    if (_terms.length != _pairCount || _pairCount == 0) return;
    final rng = Random(widget.setId.hashCode ^ _moves ^ DateTime.now().millisecondsSinceEpoch);
    final terms = List<Map<String, String>>.from(_terms.map((e) => Map<String, String>.from(e)));
    final defs = List<Map<String, String>>.from(_defs.map((e) => Map<String, String>.from(e)));
    terms.shuffle(rng);
    defs.shuffle(rng);
    setState(() {
      _terms = terms;
      _defs = defs;
      _matched.clear();
      _selectedTermId = null;
      _selectedDefId = null;
      _moves = 0;
    });
  }

  Future<void> _tryMatch() async {
    if (_selectedTermId == null || _selectedDefId == null) return;
    final ok = _selectedTermId == _selectedDefId;
    setState(() => _moves += 1);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Ghép cặp', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: _buildBody(theme),
    );
  }

  Widget _buildBody(ThemeData theme) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_loadError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lỗi: $_loadError', textAlign: TextAlign.center, style: const TextStyle(color: AppColors.error)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadMatchData,
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      );
    }
    if (_pairCount == 0) {
      return const Center(child: Text('Không tạo được trò chơi ghép cặp', style: TextStyle(color: AppColors.textTertiary)));
    }

    final total = _pairCount;
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
                  color: AppColors.success.withValues(alpha: 0.12),
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
                  onPressed: _shuffleAgain,
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.grey300),
            ),
            child: Row(
              children: [
                Icon(Icons.grid_view_rounded, size: 20, color: AppColors.primary.withValues(alpha: 0.9)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Ghép mỗi thuật ngữ với đúng định nghĩa.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${_matched.length}/$total',
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: AppColors.primary),
                  ),
                ),
                const SizedBox(width: 8),
                Text('$_moves lượt', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.textTertiary)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _MatchColumn(
                    title: 'Thuật ngữ',
                    accent: AppColors.primary,
                    items: _terms,
                    matched: _matched,
                    selectedId: _selectedTermId,
                    onSelect: (id) async {
                      if (_matched.contains(id)) return;
                      setState(() => _selectedTermId = id);
                      await _tryMatch();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MatchColumn(
                    title: 'Định nghĩa',
                    accent: const Color(0xFF7C3AED),
                    items: _defs,
                    matched: _matched,
                    selectedId: _selectedDefId,
                    onSelect: (id) async {
                      if (_matched.contains(id)) return;
                      setState(() => _selectedDefId = id);
                      await _tryMatch();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchColumn extends StatelessWidget {
  final String title;
  final Color accent;
  final List<Map<String, String>> items;
  final Set<String> matched;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  const _MatchColumn({
    required this.title,
    required this.accent,
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
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.grey300),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: AppColors.grey300.withValues(alpha: 0.9)),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final id = items[index]['id']!;
                final text = items[index]['text']!;
                final isMatched = matched.contains(id);
                final isSelected = selectedId == id;

                return Opacity(
                  opacity: isMatched ? 0.38 : 1,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: isMatched ? null : () => onSelect(id),
                      borderRadius: BorderRadius.circular(14),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: isSelected ? accent.withValues(alpha: 0.1) : AppColors.background,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected ? accent.withValues(alpha: 0.65) : AppColors.grey300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: Center(
                          child: Text(
                            text,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              height: 1.25,
                              color: isMatched ? AppColors.textTertiary : AppColors.textPrimary,
                            ),
                          ),
                        ),
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

