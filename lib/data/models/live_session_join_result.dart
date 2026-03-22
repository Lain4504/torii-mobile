class LiveSessionJoinResult {
  final String token;
  final String? roomId;
  final String? roomTitle;

  const LiveSessionJoinResult({
    required this.token,
    this.roomId,
    this.roomTitle,
  });
}
