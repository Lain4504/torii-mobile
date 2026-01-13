import 'package:flutter/material.dart';
import '../../constants/app_design_system.dart';

class ZenTextField extends StatelessWidget {
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

  const ZenTextField({
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
          height: 60, // Standard thon dài height
          decoration: BoxDecoration(
            color: enabled 
                ? AppColors.white.withOpacity(0.7) 
                : AppColors.grey100.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(
              color: AppColors.borderLight.withOpacity(0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.01),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: TextFormField(
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
                letterSpacing: 0.5,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.textTertiary.withOpacity(0.3),
                  fontWeight: AppTypography.medium,
                  fontSize: 14,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(icon, size: 20, color: AppColors.primary.withOpacity(0.4)),
                ),
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  borderSide: BorderSide(
                    color: AppColors.primary.withOpacity(0.6),
                    width: 1.5,
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
