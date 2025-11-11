import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/theme/styles.dart';
import 'package:untitled/src/core/utils/images.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';

import '../theme/colors.dart';

class AppbarBackIconWidget extends StatelessWidget {
  const AppbarBackIconWidget({super.key , this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(onTap: title != null? (){} : () => Navigator.pop(context),child: SvgImageWidget(image: SvgImages.arrowBack)),
        3.horizontalSpace,
        if(title != null)
        Text(title! , style: getRegularStyle(fontSize: 17.sp , color: AppColors.primary),)
      ],
    );
  }
}
