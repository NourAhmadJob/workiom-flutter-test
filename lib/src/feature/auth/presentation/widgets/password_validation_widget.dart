import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/images.dart';
import '../../domain/entities/setting_profile.dart';

class PasswordValidationWidget extends StatelessWidget {
  final SettingProfile? settingProfile;
  final String currentPassword;

  const PasswordValidationWidget({
    super.key,
    required this.settingProfile,
    required this.currentPassword,
  });

  bool get isPasswordCorrect {
    if (settingProfile == null) return false;
    return checkRules().every((rule) => rule.isValid);
  }

  List<ValidationRule> checkRules() {
    if (settingProfile == null) return [];

    return [
      ValidationRule(
        text: 'Passwords must have at least ${settingProfile!.requiredLength} characters',
        isValid: currentPassword.length >= settingProfile!.requiredLength,
      ),
      if (settingProfile!.requireUppercase)
        ValidationRule(
          text: "Passwords must have at least one uppercase ('A'-'Z').",
          isValid: currentPassword.contains(RegExp(r'[A-Z]')),
        ),
      if (settingProfile!.requireLowercase)
        ValidationRule(
          text: "Passwords must have at least one lowercase ('a'-'z').",
          isValid: currentPassword.contains(RegExp(r'[a-z]')),
        ),
      if (settingProfile!.requireDigit)
        ValidationRule(
          text: 'Passwords must have at least one digit (\'0\'-\'9\').',
          isValid: currentPassword.contains(RegExp(r'[0-9]')),
        ),
      if (settingProfile!.requireNonAlphanumeric)
        ValidationRule(
          text: 'Passwords must have at least one non alphanumeric character.',
          isValid: currentPassword.contains(RegExp(r'[^a-zA-Z0-9]')),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (settingProfile == null) {
      return const SizedBox.shrink();
    }

    final rules = checkRules();
    final allIsValid = isPasswordCorrect;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgImageWidget(
              image:  allIsValid ? SvgImages.correct : SvgImages.info,
              width: 20.w,
              height: 20.h,
            ),
            8.horizontalSpace,
            Text(
              'Not enought strong',
              style: getMediumStyle(
                fontSize: 15.sp,
                color:AppColors.blackTitle,
              ),
            ),
          ],
        ),
        12.verticalSpace,
        ...rules.map((rule) => validationItem(rule)),
      ],
    );
  }

  Widget validationItem(ValidationRule rule) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgImageWidget(
           image:  rule.isValid ? SvgImages.correct : SvgImages.close,
            width: 16.w,
            height: 16.h,
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              rule.text,
              style: getRegularStyle(
                fontSize: 12.sp,
                color: AppColors.greyTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ValidationRule {
  final String text;
  final bool isValid;

  ValidationRule({
    required this.text,
    required this.isValid,
  });
}

