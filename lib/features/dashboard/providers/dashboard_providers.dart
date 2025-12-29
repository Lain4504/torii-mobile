import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_state.dart';

/// Provider for dashboard state
final dashboardProvider = NotifierProvider<DashboardNotifier, DashboardState>(
  DashboardNotifier.new,
);
