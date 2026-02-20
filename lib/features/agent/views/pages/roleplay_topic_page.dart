import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class RoleplayTopicPage extends ConsumerStatefulWidget {
  const RoleplayTopicPage({super.key});

  @override
  ConsumerState<RoleplayTopicPage> createState() => _RoleplayTopicPageState();
}

class _RoleplayTopicPageState extends ConsumerState<RoleplayTopicPage> {
  final TextEditingController _topicController = TextEditingController();
  
  final List<String> _suggestedTopics = [
    "Đi siêu thị",
    "Gọi điện thoại",
    "Hỏi đường",
    "Kết bạn mới",
    "Tại sân bay",
    "Phỏng vấn xin việc",
    "Đặt món ở nhà hàng",
    "Mua vé tàu",
  ];

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  void _startRoleplay(String topic) {
    if (topic.trim().isEmpty) return;
    context.push('/roleplay/chat', extra: topic.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('AI Roleplay', style: TextStyle(fontWeight: AppTypography.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.spatial_audio_off_rounded,
                size: 50,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Roleplay với Sensei',
              style: TextStyle(
                fontSize: 28,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Chọn một chủ đề hoặc nhập chủ đề của riêng bạn.\nSensei sẽ cùng bạn luyện tập hội thoại.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                hintText: 'Nhập chủ đề (VD: Mua vé tàu)...',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
              onSubmitted: (value) => _startRoleplay(value),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _startRoleplay(_topicController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Bắt đầu hội thoại',
                  style: TextStyle(fontSize: 18, fontWeight: AppTypography.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Divider(height: 1),
            const SizedBox(height: 32),
            const Text(
              'GỢI Ý CHỦ ĐỀ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: AppTypography.bold,
                color: AppColors.textTertiary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: _suggestedTopics.map((topic) {
                return InkWell(
                  onTap: () => _startRoleplay(topic),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Text(
                      topic,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: AppTypography.medium,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
