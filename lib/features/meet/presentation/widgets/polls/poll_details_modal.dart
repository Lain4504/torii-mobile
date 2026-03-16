import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/core/constants/app_design_system.dart';
import 'package:torii_app/features/meet/data/models/poll.dart';
import '../../../providers/session_provider.dart';
import '../../../providers/participant_provider.dart';
import '../../../data/datasources/meet_api_service.dart';

/// Poll Details Modal (admin only)
/// Shows detailed poll results with respondents and non-respondents
/// Simplified version of web DetailsModal
class PollDetailsModal extends ConsumerStatefulWidget {
  final Poll poll;
  final VoidCallback onClose;
  final VoidCallback? onPollUpdated;

  const PollDetailsModal({
    super.key,
    required this.poll,
    required this.onClose,
    this.onPollUpdated,
  });

  @override
  ConsumerState<PollDetailsModal> createState() => _PollDetailsModalState();
}

class _RespondentInfo {
  final String userId;
  final String name;
  
  _RespondentInfo({required this.userId, required this.name});
}

class _PollDetailsModalState extends ConsumerState<PollDetailsModal> {
  bool _isLoading = false;
  Map<int, List<_RespondentInfo>> _optionRespondents = {}; // optionId -> [respondents]
  List<_RespondentInfo> _allRespondents = [];
  int _totalResponses = 0;

  @override
  void initState() {
    super.initState();
    _loadPollDetails();
  }

  Future<void> _loadPollDetails() async {
    setState(() => _isLoading = true);
    try {
      final api = ref.read(meetApiServiceProvider);
      final response = await api.getPollResponsesDetails(widget.poll.id);
      
      if (response.status) {
        // Parse admin details (matches web parsing)
        // responses map contains: total_resp, optionId_count, all_respondents
        final responses = response.responses;
        final totalRespStr = responses['total_resp'] ?? '0';
        final totalResp = int.tryParse(totalRespStr) ?? 0;
        
        setState(() {
          _totalResponses = totalResp;
          _optionRespondents = {};
          _allRespondents = [];
        });

        // Parse all_respondents JSON string (format: ["userId:optionId:name", ...])
        final allRespondentsStr = responses['all_respondents'];
        if (allRespondentsStr != null && allRespondentsStr.isNotEmpty) {
          try {
            final respondentsList = jsonDecode(allRespondentsStr) as List<dynamic>;
            final Map<int, List<_RespondentInfo>> optionRespondentsMap = {};
            final List<_RespondentInfo> allRespondentsList = [];
            
            for (final r in respondentsList) {
              final parts = (r as String).split(':');
              if (parts.length == 3) {
                final userId = parts[0];
                final optionIdStr = parts[1];
                final name = parts[2];
                final optionId = int.tryParse(optionIdStr);
                
                if (optionId != null) {
                  final respondent = _RespondentInfo(userId: userId, name: name);
                  optionRespondentsMap.putIfAbsent(optionId, () => []).add(respondent);
                  
                  // Add to allRespondents if not already present
                  if (!allRespondentsList.any((r) => r.userId == userId)) {
                    allRespondentsList.add(respondent);
                  }
                }
              }
            }
            
            setState(() {
              _optionRespondents = optionRespondentsMap;
              _allRespondents = allRespondentsList;
            });
          } catch (e) {
            // Error parsing JSON - ignore
          }
        }
      }
    } catch (e) {
      // Error loading details
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _closePoll() async {
    try {
      final session = ref.read(sessionProvider);
      final api = ref.read(meetApiServiceProvider);
      final response = await api.closePoll(
        pollId: widget.poll.id,
        roomId: session.currentRoom.roomId,
        userId: session.currentUser?.userId ?? '',
      );

      if (mounted) {
        if (response.status) {
          widget.onPollUpdated?.call();
          widget.onClose();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.msg.isNotEmpty ? response.msg : 'Failed to close poll')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to close poll: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final participants = ref.watch(participantProvider).allParticipants;
    final allParticipantIds = participants.map((p) => p.userId).toSet();
    final respondedUserIds = _allRespondents.map((r) => r.userId).toSet();
    final notRespondents = allParticipantIds.difference(respondedUserIds).toList();

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Poll #${widget.poll.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (!widget.poll.isActive)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'CLOSED',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: widget.onClose,
                  ),
                ],
              ),
            ),

            // Question
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                ),
              ),
              child: Text(
                'Q: ${widget.poll.question}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Content
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total responses: $_totalResponses',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...widget.poll.options.asMap().entries.map((entry) {
                            final index = entry.key;
                            final option = entry.value;
                            final optionId = int.tryParse(option.id) ?? (index + 1);
                            final respondents = _optionRespondents[optionId] ?? [];
                            final percentage = _totalResponses > 0 
                                ? (respondents.length / _totalResponses * 100).toStringAsFixed(0)
                                : '0';
                            
                            return ExpansionTile(
                              title: Text('${option.text} (${respondents.length}) - $percentage%'),
                              children: [
                                if (respondents.isEmpty)
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('No respondents'),
                                  )
                                else
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: respondents.map((respondent) {
                                        return Chip(
                                          label: Text(respondent.name),
                                          avatar: CircleAvatar(
                                            radius: 12,
                                            child: Text(
                                              respondent.name.isNotEmpty 
                                                  ? respondent.name[0].toUpperCase() 
                                                  : '?',
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                              ],
                            );
                          }),
                          const SizedBox(height: 16),
                          ExpansionTile(
                            title: Text('Not responded (${notRespondents.length})'),
                            children: [
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: notRespondents.map((userId) {
                                  final participant = participants.firstWhere(
                                    (p) => p.userId == userId,
                                    orElse: () => participants.first,
                                  );
                                  return Chip(
                                    label: Text(participant.name),
                                    avatar: CircleAvatar(
                                      child: Text(participant.name[0].toUpperCase()),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),

            // Footer actions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.poll.isActive)
                    ElevatedButton(
                      onPressed: _closePoll,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: AppColors.textOnPrimary,
                      ),
                      child: const Text('End Poll'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
