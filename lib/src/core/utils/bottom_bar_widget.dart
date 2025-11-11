import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/styles.dart';
import 'package:untitled/src/core/utils/images.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';

import '../theme/colors.dart';

class BottomBarWidget extends StatelessWidget {
   BottomBarWidget({super.key , this.withLang = false});
  bool? withLang;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(withLang == true)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImageWidget(image: SvgImages.earth,height: 16,width: 16,),
            8.horizontalSpace,
            Text('English' , style: getRegularStyle(fontSize: 12.sp ,color: AppColors.greyTitle),),
            8.horizontalSpace,
            SvgImageWidget(image: SvgImages.arrowBottom ,height: 4.h, width: 4.w,),
          ],
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stay organized with' , style: getRegularStyle(fontSize: 15.sp ,color: AppColors.greyTitle),),
            8.horizontalSpace,
            SvgImageWidget(image: SvgImages.workIom ,height: 31.h,width: 31.w,),
          ],
        ),
      ],
    );
  }
}
