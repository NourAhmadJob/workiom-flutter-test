import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final double liner;

  const PasswordStrengthIndicator({
    super.key,
    required this.liner,
  });

  Color get strengthColor {
    if (liner >= 0.75) return AppColors.green;
    if (liner >= 0.5) return AppColors.mango;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: LinearProgressIndicator(
        value: liner,
        minHeight: 8.h,
        backgroundColor: AppColors.linerGrey,
        valueColor:  AlwaysStoppedAnimation<Color>(
         strengthColor
        ),
      ),
    );
  }
}

