import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/utils/images.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
import '../widgets/image_widget.dart';
import '../widgets/main_button.dart';

class MainButtonWidget extends StatelessWidget {
   MainButtonWidget({super.key,required this.title , this.onPress , this.isMainColor = true,this.isLoading = false});

  final String title;
 final void Function()? onPress;
 bool? isLoading;
 bool? isMainColor;
  @override
  Widget build(BuildContext context) {
    return MainButton(
      text: '',
      onPress: onPress,
      isLoading: isLoading,
      buttonColor: isMainColor == true ? null : AppColors.grey,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
           title,
            style: getMediumStyle(
              fontSize: 15.sp,
              color: AppColors.white,
            ),
          ),
          Spacer(),
          SvgImageWidget(image: isMainColor == true ?  SvgImages.back : SvgImages.back2),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
