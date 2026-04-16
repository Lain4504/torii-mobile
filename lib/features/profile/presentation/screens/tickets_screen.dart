import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:torii_app/core/providers/ticket_providers.dart';
import 'package:torii_app/data/models/ticket_models.dart';
import 'package:torii_app/data/models/academy_models.dart';
import 'package:torii_app/data/repositories/ticket_repository.dart';
import 'package:torii_app/data/repositories/academy_repository.dart';
import 'package:torii_app/core/providers/api_providers.dart';
import 'package:intl/intl.dart';

class TicketsScreen extends ConsumerStatefulWidget {
  const TicketsScreen({super.key});

  @override
  ConsumerState<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends ConsumerState<TicketsScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedType = 'SUPPORT';
  EnrollmentModel? _selectedEnrollment;
  List<EnrollmentModel> _enrollments = [];
  bool _isLoadingEnrollments = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _loadEnrollments() async {
    setState(() => _isLoadingEnrollments = true);
    try {
      final repo = ref.read(academyRepositoryProvider);
      final res = await repo.getMyEnrollments(limit: 100);
      if (mounted) {
        setState(() {
          _enrollments = res.data;
          _isLoadingEnrollments = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoadingEnrollments = false);
    }
  }

  Future<Map<String, dynamic>> _getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      return {
        'device': 'Android ${android.model}',
        'osVersion': android.version.release,
        'appVersion': '1.0.0', // Fallback or use package_info_plus if available
      };
    } else if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      return {
        'device': ios.name,
        'osVersion': ios.systemVersion,
        'appVersion': '1.0.0',
      };
    }
    return {'device': 'Unknown'};
  }

  Future<void> _showCreateTicketDialog(BuildContext context) async {
    _titleController.clear();
    _contentController.clear();
    _selectedType = 'SUPPORT';
    _selectedEnrollment = null;
    final theme = Theme.of(context);
    
    // Pre-load enrollments for refund type
    _loadEnrollments();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Gửi yêu cầu hỗ trợ',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Loại yêu cầu',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'SUPPORT', child: Text('Hỗ trợ tổng quát')),
                    DropdownMenuItem(value: 'ERROR_REPORT', child: Text('Báo lỗi ứng dụng')),
                    DropdownMenuItem(value: 'REFUND', child: Text('Yêu cầu hoàn tiền')),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _selectedType = val);
                      this.setState(() => _selectedType = val);
                    }
                  },
                ),
                if (_selectedType == 'REFUND') ...[
                  const SizedBox(height: 16),
                  if (_isLoadingEnrollments)
                    const Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ))
                  else
                    DropdownButtonFormField<EnrollmentModel>(
                      value: _selectedEnrollment,
                      decoration: const InputDecoration(
                        labelText: 'Chọn khóa học muốn hoàn tiền',
                        border: OutlineInputBorder(),
                        helperText: 'Chỉ hoàn tiền trong vòng 14 ngày đăng ký',
                      ),
                      items: _enrollments.map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.courseTitle,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      )).toList(),
                      onChanged: (val) {
                        setState(() => _selectedEnrollment = val);
                        this.setState(() => _selectedEnrollment = val);
                      },
                    ),
                ],
                const SizedBox(height: 16),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Tiêu đề',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: 'Mô tả chi tiết',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  minLines: 3,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isSubmitting
                      ? null
                      : () async {
                          if (_titleController.text.trim().isEmpty ||
                              _contentController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin')),
                            );
                            return;
                          }
                          
                          if (_selectedType == 'REFUND' && _selectedEnrollment == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Vui lòng chọn khóa học cần hoàn tiền')),
                            );
                            return;
                          }

                          setState(() => _isSubmitting = true);
                          try {
                            final deviceInfo = await _getDeviceInfo();
                            final repo = ref.read(ticketRepositoryProvider);
                            
                            await repo.createTicket(
                              type: _selectedType,
                              subject: _titleController.text.trim(),
                              description: _contentController.text.trim(),
                              liveClassId: _selectedType == 'REFUND' && _selectedEnrollment?.isLive == true 
                                ? _selectedEnrollment?.liveClassId : null,
                              vodPackageId: _selectedType == 'REFUND' && _selectedEnrollment?.isLive == false 
                                ? _selectedEnrollment?.vodPackageId : null,
                              metadata: {
                                ...deviceInfo,
                                if (_selectedType == 'REFUND') 'courseTitle': _selectedEnrollment?.courseTitle,
                              },
                            );
                            if (context.mounted) {
                              Navigator.pop(ctx);
                              ref.invalidate(myTicketsProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Đã gửi yêu cầu thành công!')),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Lỗi: $e')),
                              );
                            }
                          } finally {
                            if (mounted) {
                              setState(() => _isSubmitting = false);
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Gửi yêu cầu'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ticketsAsync = ref.watch(myTicketsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Trợ giúp & Hỗ trợ',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: theme.colorScheme.onSurface),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/settings');
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.add_circle, color: theme.colorScheme.primary, size: 28),
              onPressed: () => _showCreateTicketDialog(context),
              tooltip: 'Tạo ticket mới',
            ),
          ),
        ],
      ),
      body: ticketsAsync.when(
        data: (tickets) {
          if (tickets.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.support_agent, size: 64, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(height: 16),
                  Text(
                    'Bạn chưa có yêu cầu hỗ trợ nào.',
                    style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(myTicketsProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final t = tickets[index];
                return _buildTicketCard(context, t);
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text('Lỗi: $e', style: TextStyle(color: theme.colorScheme.error)),
        ),
      ),
    );
  }

  Widget _buildTicketCard(BuildContext context, TicketModel ticket) {
    final theme = Theme.of(context);
    final isClosed = ticket.status == 'RESOLVED' || ticket.status == 'CLOSED';
    final dateStr = ticket.createdAt != null
        ? DateFormat('dd/MM/yyyy HH:mm').format(ticket.createdAt!)
        : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (isClosed ? Colors.grey : theme.colorScheme.primary).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  ticket.status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isClosed ? Colors.grey.shade700 : theme.colorScheme.primary,
                  ),
                ),
              ),
              if (dateStr.isNotEmpty)
                Text(
                  dateStr,
                  style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurfaceVariant),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            ticket.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            ticket.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
