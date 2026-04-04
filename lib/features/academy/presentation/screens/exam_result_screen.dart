import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/providers/api_providers.dart';

class ExamResultScreen extends ConsumerStatefulWidget {
  const ExamResultScreen({
    super.key,
    required this.attemptId,
    required this.examId,
  });

  final String attemptId;
  final String examId;

  @override
  ConsumerState<ExamResultScreen> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends ConsumerState<ExamResultScreen> {
  bool _loading = true;
  String? _errorMessage;
  Map<String, dynamic>? _attemptData;
  Map<String, dynamic>? _examData;

  @override
  void initState() {
    super.initState();
    _fetchResults();
  }

  Future<void> _fetchResults() async {
    try {
      final repo = ref.read(academyRepositoryProvider);
      
      final responses = await Future.wait([
        repo.getAssessmentAttempt(widget.attemptId),
        repo.getExam(widget.examId),
      ]);

      setState(() {
        _attemptData = responses[0];
        _examData = responses[1] ?? responses[0]?['exam'];
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _errorMessage = 'Lỗi tải kết quả: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_errorMessage != null || _attemptData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Kết quả')),
        body: Center(child: Text(_errorMessage ?? 'Không tìm thấy kết quả')),
      );
    }

    final theme = Theme.of(context);
    final title = _examData?['title'] ?? 'Bài kiểm tra';
    final score = _attemptData!['score'] ?? _attemptData!['actualScore'] ?? 0;
    final maxScore = _attemptData!['totalScore'] ?? 100;
    
    var percentage = 0.0;
    if (maxScore > 0) percentage = (score / maxScore) * 100;

    final isPassed = _attemptData!['isPassed'] ?? _attemptData!['passed'] ?? false;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Kết quả bài thi'),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: theme.iconTheme,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 500),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.workspace_premium, size: 64, color: theme.colorScheme.onPrimary),
                          const SizedBox(height: 16),
                          Text(
                            'Kết quả bài thi',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            title,
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary.withOpacity(0.8),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    // Score Section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text('ĐIỂM SỐ', style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5), fontSize: 13, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 8),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text('${percentage.toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: theme.dividerColor.withOpacity(0.2),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('KẾT QUẢ', style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5), fontSize: 13, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 8),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    isPassed ? 'ĐẠT' : 'TRƯỢT',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: isPassed ? const Color(0xFF4CAF50) : const Color(0xFFE53935),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Message Section
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        color: isPassed 
                            ? const Color(0xFF4CAF50).withOpacity(0.1) 
                            : const Color(0xFFE53935).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            isPassed ? 'Chúc mừng bạn đã hoàn thành bài thi!' : 'Hãy cố gắng hơn ở lần thi sau nhé!',
                            style: TextStyle(
                              color: isPassed ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Hệ thống đã ghi nhận kết quả.',
                            style: TextStyle(
                              color: isPassed ? const Color(0xFF2E7D32).withOpacity(0.7) : const Color(0xFFC62828).withOpacity(0.7),
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Button Section
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Quay lại',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
