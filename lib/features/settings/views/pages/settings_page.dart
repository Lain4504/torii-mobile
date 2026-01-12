import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_design_system.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/widgets/cards/minimal_card.dart';

/// Settings Page - Language and App Preferences
/// 
/// A clean settings page for managing app preferences including language selection.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentLocale = ref.watch(localeProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.settings,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: AppTypography.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.pageHorizontal,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),
              
              // Language Section
              _buildLanguageSection(context, ref, currentLocale, l10n, theme),
              
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSection(
    BuildContext context,
    WidgetRef ref,
    Locale currentLocale,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.language,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: AppTypography.semiBold,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        MinimalCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _LanguageOption(
                locale: const Locale('en'),
                label: l10n.english,
                currentLocale: currentLocale,
                onTap: () {
                  ref.read(localeProvider.notifier).setLocale(const Locale('en'));
                },
              ),
              const Divider(height: 1),
              _LanguageOption(
                locale: const Locale('vi'),
                label: l10n.vietnamese,
                currentLocale: currentLocale,
                onTap: () {
                  ref.read(localeProvider.notifier).setLocale(const Locale('vi'));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final Locale locale;
  final String label;
  final Locale currentLocale;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.locale,
    required this.label,
    required this.currentLocale,
    required this.onTap,
  });

  bool get isSelected => locale.languageCode == currentLocale.languageCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: isSelected
                        ? AppTypography.semiBold
                        : AppTypography.regular,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primary,
                  size: AppIconSize.md,
                )
              else
                Icon(
                  Icons.radio_button_unchecked,
                  color: AppColors.textTertiary,
                  size: AppIconSize.md,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
