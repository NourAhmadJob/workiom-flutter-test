import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';
import 'package:untitled/src/core/widgets/main_button.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
import '../utils/images.dart';

class SignInWithGoogleWidget extends StatelessWidget {
  const SignInWithGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      text: '',
      onPress: () {},
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgImageWidget(
            image: SvgImages.google,
            width: 16.w,
            height: 16.h,
          ),
          8.horizontalSpace,
          Text(
            'Continue with google',
            style: getMediumStyle(
              fontSize: 15.sp,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      buttonColor: AppColors.greyLight,
    );
  }
}
