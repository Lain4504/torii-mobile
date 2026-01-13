import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/auth/providers/auth_providers.dart';

class TwoFactorStatus {
  final bool isEnabled;
  final String? method;

  TwoFactorStatus({required this.isEnabled, this.method});

  factory TwoFactorStatus.fromJson(Map<String, dynamic> json) {
    return TwoFactorStatus(
      isEnabled: json['isEnabled'] ?? false,
      method: json['method'],
    );
  }
}

class TwoFactorSetupData {
  final String secret;
  final String otpauthUrl;

  TwoFactorSetupData({required this.secret, required this.otpauthUrl});

  factory TwoFactorSetupData.fromJson(Map<String, dynamic> json) {
    return TwoFactorSetupData(
      secret: json['secret'] ?? '',
      otpauthUrl: json['otpauthUrl'] ?? '',
    );
  }
}

class TwoFactorState {
  final bool isLoading;
  final TwoFactorStatus? status;
  final TwoFactorSetupData? setupData;
  final List<String>? backupCodes;
  final String? error;

  TwoFactorState({
    this.isLoading = false,
    this.status,
    this.setupData,
    this.backupCodes,
    this.error,
  });

  TwoFactorState copyWith({
    bool? isLoading,
    TwoFactorStatus? status,
    TwoFactorSetupData? setupData,
    List<String>? backupCodes,
    String? error,
  }) {
    return TwoFactorState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      setupData: setupData ?? this.setupData,
      backupCodes: backupCodes ?? this.backupCodes,
      error: error ?? this.error,
    );
  }
}

class TwoFactorNotifier extends Notifier<TwoFactorState> {
  @override
  TwoFactorState build() {
    return TwoFactorState();
  }

  Future<void> fetchStatus() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authService = ref.read(authServiceProvider);
      final response = await authService.get2FAStatus();
      if (response.success && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          status: TwoFactorStatus.fromJson(response.data!),
        );
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> startSetup() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authService = ref.read(authServiceProvider);
      final response = await authService.generateTOTPSecret();
      if (response.success && response.data != null) {
        state = state.copyWith(
          isLoading: false,
          setupData: TwoFactorSetupData.fromJson(response.data!),
        );
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> enable(String code) async {
    if (state.setupData == null) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authService = ref.read(authServiceProvider);
      final response = await authService.enableTOTP(state.setupData!.secret, code);
      if (response.success) {
        state = state.copyWith(backupCodes: response.data);
        await fetchStatus();
        state = state.copyWith(setupData: null);
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> disable(String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authService = ref.read(authServiceProvider);
      final response = await authService.disable2FA(password);
      if (response.success) {
        await fetchStatus();
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> regenerateBackupCodes() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authService = ref.read(authServiceProvider);
      final response = await authService.regenerateBackupCodes();
      if (response.success) {
        state = state.copyWith(isLoading: false, backupCodes: response.data);
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final twoFactorProvider = NotifierProvider<TwoFactorNotifier, TwoFactorState>(TwoFactorNotifier.new);
