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
  final void Function(String)? onChanged;
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
    this.onChanged,
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
          padding: const EdgeInsets.only(left: 12, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: AppTypography.black,
              letterSpacing: 2.5,
              color: AppColors.textTertiary,
            ),
          ),
        ),
        Container(
          height: maxLines > 1 ? null : 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.input),
            boxShadow: AppElevation.softShadow,
          ),

          child: Center(
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onFieldSubmitted: onSubmitted,
              onChanged: onChanged,
              enabled: enabled,
              readOnly: readOnly,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: AppTypography.bold,
                color: AppColors.textPrimary,
                letterSpacing: 0.5,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.textTertiary.withValues(alpha: 0.3),
                  fontWeight: AppTypography.medium,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: enabled 
                    ? AppColors.white.withValues(alpha: 0.7) 
                    : AppColors.grey100.withValues(alpha: 0.5),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(icon, size: 20, color: AppColors.primary.withValues(alpha: 0.4)),
                ),
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  borderSide: BorderSide(
                    color: AppColors.grey200.withValues(alpha: 0.8),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),

                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
