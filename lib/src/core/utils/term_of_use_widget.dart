import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
class TermOfUseWidget extends StatelessWidget {
  const TermOfUseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: getRegularStyle(
          fontSize: 13.sp,
          color: AppColors.greyTitle,
        ),
        children: [
          const TextSpan(text: 'By signing up, you agree '),
          TextSpan(
            text: 'Terms Of Service\n',
            style: getRegularStyle(
              fontSize: 13.sp,
              color: AppColors.greyTitle,
            ).copyWith(decoration: TextDecoration.underline),
          ),
          const TextSpan(text: 'And ',),
          TextSpan(
            text: 'Privacy Policy',
            style: getRegularStyle(
              fontSize: 13.sp,
              color: AppColors.greyTitle,
            ).copyWith(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
