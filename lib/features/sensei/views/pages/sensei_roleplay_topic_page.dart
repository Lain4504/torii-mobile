import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';

class SenseiRoleplayTopicPage extends ConsumerStatefulWidget {
  const SenseiRoleplayTopicPage({super.key});

  @override
  ConsumerState<SenseiRoleplayTopicPage> createState() => _SenseiRoleplayTopicPageState();
}

class _SenseiRoleplayTopicPageState extends ConsumerState<SenseiRoleplayTopicPage> {
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
    context.push('/sensei/roleplay-chat', extra: topic.trim());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'AI Roleplay',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.spatial_audio_off_rounded,
                size: 28,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Roleplay với Sensei',
              style: TextStyle(
                fontSize: 20,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Chọn một chủ đề hoặc nhập chủ đề của riêng bạn.\nSensei sẽ cùng bạn luyện tập hội thoại.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textTertiary,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                hintText: 'Nhập chủ đề (VD: Mua vé tàu)...',
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.grey300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.grey300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              onSubmitted: (value) => _startRoleplay(value),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => _startRoleplay(_topicController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentDark,
                  foregroundColor: AppColors.textOnAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Bắt đầu hội thoại',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(height: 1),
            const SizedBox(height: 16),
            Text(
              'GỢI Ý CHỦ ĐỀ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: AppTypography.bold,
                color: AppColors.textTertiary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: _suggestedTopics.map((topic) {
                return InkWell(
                  onTap: () => _startRoleplay(topic),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.grey300),
                    ),
                    child: Text(
                      topic,
                      style: TextStyle(
                        fontSize: 12.5,
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
