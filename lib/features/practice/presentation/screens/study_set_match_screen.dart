import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class StudySetMatchScreen extends ConsumerStatefulWidget {
  final String setId;
  const StudySetMatchScreen({super.key, required this.setId});

  @override
  ConsumerState<StudySetMatchScreen> createState() => _StudySetMatchScreenState();
}

class _StudySetMatchScreenState extends ConsumerState<StudySetMatchScreen> {
  List<_MatchItem> _items = [];
  String? _selectedUniqueId;
  String? _wrongUniqueId;
  final Set<String> _matchedIds = {}; // Card IDs that are matched
  
  bool _loading = true;
  bool _finished = false;
  Object? _error;
  
  Timer? _timer;
  int _seconds = 0;
  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initGame() async {
    setState(() {
      _loading = true;
      _error = null;
      _finished = false;
      _matchedIds.clear();
      _selectedUniqueId = null;
      _wrongUniqueId = null;
      _seconds = 0;
    });
    
    try {
      final repo = ref.read(academyRepositoryProvider);
      final pairs = await repo.getStudySetMatchGame(widget.setId, count: 6);
      
      if (!mounted) return;
      
      if (pairs.isEmpty) {
        setState(() {
          _loading = false;
          _error = "Không có đủ thẻ để tạo trò chơi.";
        });
         return;
      }

      final List<_MatchItem> flattened = [];
      for (final p in pairs) {
        final id = (p['id'] ?? '').toString();
        flattened.add(_MatchItem(id: id, text: (p['term'] ?? '').toString(), type: _MatchItemType.term, uniqueId: '$id-term'));
        flattened.add(_MatchItem(id: id, text: (p['definition'] ?? '').toString(), type: _MatchItemType.definition, uniqueId: '$id-def'));
      }

      flattened.shuffle(math.Random());

      setState(() {
        _items = flattened;
        _loading = false;
        _startTime = DateTime.now();
      });
      
      _startTimer();
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = e;
        });
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_finished) {
        timer.cancel();
        return;
      }
      setState(() {
        _seconds = DateTime.now().difference(_startTime!).inSeconds;
      });
    });
  }

  Future<void> _handleSelect(_MatchItem item) async {
    if (_matchedIds.contains(item.id) || _finished || _loading) return;
    if (_selectedUniqueId == item.uniqueId) {
      setState(() => _selectedUniqueId = null);
      return;
    }

    if (_selectedUniqueId == null) {
      setState(() => _selectedUniqueId = item.uniqueId);
      return;
    }

    final firstItem = _items.firstWhere((it) => it.uniqueId == _selectedUniqueId);
    
    // Check match
    if (firstItem.id == item.id && firstItem.type != item.type) {
      // Match!
      HapticFeedback.lightImpact();
      setState(() {
        _matchedIds.add(item.id);
        _selectedUniqueId = null;
        if (_matchedIds.length == _items.length ~/ 2) {
          _finished = true;
          _timer?.cancel();
        }
      });
    } else {
      // Wrong
      HapticFeedback.heavyImpact();
      setState(() {
        _wrongUniqueId = item.uniqueId;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() {
          _selectedUniqueId = null;
          _wrongUniqueId = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Ghép cặp', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '${_seconds}s',
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, fontFeatures: [FontFeature.tabularFigures()]),
              ),
            ),
          ),
        ],
      ),
      body: _buildContent(theme),
    );
  }

  Widget _buildContent(ThemeData theme) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lỗi: $_error', style: TextStyle(color: theme.colorScheme.error)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _initGame, child: const Text('Thử lại')),
          ],
        ),
      );
    }

    if (_finished) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                 padding: const EdgeInsets.all(24),
                 decoration: BoxDecoration(
                   color: Colors.amber.withOpacity(0.1),
                   shape: BoxShape.circle,
                 ),
                 child: const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
               ),
               const SizedBox(height: 24),
               Text('Tuyệt vời!', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
               const SizedBox(height: 12),
               Text(
                 'Bạn đã hoàn thành trong $_seconds giây.',
                 style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
               ),
               const SizedBox(height: 32),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   OutlinedButton(
                     onPressed: () => Navigator.pop(context),
                     style: OutlinedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                     ),
                     child: const Text('Quay lại'),
                   ),
                   const SizedBox(width: 16),
                   ElevatedButton(
                     onPressed: _initGame,
                     style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                     ),
                     child: const Text('Chơi lại'),
                   ),
                 ],
               ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final isMatched = _matchedIds.contains(item.id);
                final isSelected = _selectedUniqueId == item.uniqueId;
                final isWrong = _wrongUniqueId == item.uniqueId;
                
                return _MatchCard(
                  item: item,
                  isMatched: isMatched,
                  isSelected: isSelected,
                  isWrong: isWrong,
                  onTap: () => _handleSelect(item),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Hãy chọn một thuật ngữ và nghĩa tương ứng để chúng biến mất!',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _MatchCard extends StatelessWidget {
  final _MatchItem item;
  final bool isMatched;
  final bool isSelected;
  final bool isWrong;
  final VoidCallback onTap;

  const _MatchCard({
    required this.item,
    required this.isMatched,
    required this.isSelected,
    required this.isWrong,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (isMatched) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.3), style: BorderStyle.none),
        ),
      );
    }

    Color bgColor = theme.colorScheme.surface;
    Color borderColor = theme.colorScheme.outlineVariant;
    Color textColor = theme.colorScheme.onSurface;

    if (isSelected) {
      bgColor = theme.colorScheme.primary;
      borderColor = theme.colorScheme.primary;
      textColor = theme.colorScheme.onPrimary;
    } else if (isWrong) {
      bgColor = theme.colorScheme.errorContainer;
      borderColor = theme.colorScheme.error;
      textColor = theme.colorScheme.onErrorContainer;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: isSelected
              ? [BoxShadow(color: theme.colorScheme.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
              : null,
        ),
        child: Center(
          child: Text(
            item.text,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

enum _MatchItemType { term, definition }

class _MatchItem {
  final String id;
  final String text;
  final _MatchItemType type;
  final String uniqueId;

  _MatchItem({required this.id, required this.text, required this.type, required this.uniqueId});
}
