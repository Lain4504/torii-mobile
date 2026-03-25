import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/sensei_subscription_models.dart';
import 'sensei_providers.dart';

final senseiSubscriptionPlansProvider =
    FutureProvider<List<SenseiSubscriptionPlan>>((ref) async {
  final repo = ref.read(senseiRepositoryProvider);
  return repo.getSubscriptionPlans();
});

final senseiQuotaStatusProvider = FutureProvider<SenseiQuotaStatus>((ref) async {
  final repo = ref.read(senseiRepositoryProvider);
  return repo.getQuotaStatus();
});

