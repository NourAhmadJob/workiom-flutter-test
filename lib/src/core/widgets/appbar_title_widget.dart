import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/styles.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';

import '../theme/colors.dart';
import '../utils/images.dart';

class AppbarTitleWidget extends StatelessWidget {
  const AppbarTitleWidget({super.key ,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: getMediumStyle(fontSize: 22.sp),),
        8.verticalSpace,
        Row(
          children: [
            Text('Let\'s start an amazing journey!' ,style: getRegularStyle(fontSize: 17.sp,color: AppColors.greyTitle)),
            8.horizontalSpace,
            SvgImageWidget(image: SvgImages.hand)
          ],
        )
      ],
    );
  }
}
