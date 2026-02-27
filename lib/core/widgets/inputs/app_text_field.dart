import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

class AppTextField extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final bool readOnly;
  final int maxLines;

  const AppTextField({

    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 1.5,
              color: AppColors.mutedForeground,
            ),
          ),
        ),
        Container(
          height: maxLines > 1 ? null : 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.input),
          ),
          child: Center(
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onFieldSubmitted: onSubmitted,
              enabled: enabled,
              readOnly: readOnly,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
                letterSpacing: 0.1,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.mutedForeground.withValues(alpha: 0.3),
                  fontWeight: AppTypography.medium,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: enabled 
                    ? Colors.white.withValues(alpha: 0.5) 
                    : AppColors.secondary.withValues(alpha: 0.3),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    icon, 
                    size: 18, 
                    color: AppColors.primary.withValues(alpha: 0.6),
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 40),
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  borderSide: BorderSide(
                    color: AppColors.border.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  borderSide: BorderSide(
                    color: AppColors.border.withValues(alpha: 0.8),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
