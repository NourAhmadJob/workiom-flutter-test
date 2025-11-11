import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widgets/text_form_field_widget.dart';

import '../theme/styles.dart';
import 'image_widget.dart';

class TitleWithTextFieldWidget extends StatelessWidget {
  final String title;
  final String image;
  final TextEditingController controller;
  final String hint;
  final String? suffixIcon;
  bool? showVisibilityToggle;
  String? suffixText;
  Function()? onPressedSuffixIcon;

  TitleWithTextFieldWidget({
    super.key,
    required this.title,
    required this.image,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    this.showVisibilityToggle = false,
    this.onPressedSuffixIcon,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getRegularStyle(fontSize: 15.sp)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: -1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 13.0.h),
                child: SvgImageWidget(image: image, width: 16.w, height: 16.h),
              ),
            ),
            4.horizontalSpace,
            Expanded(
              child: TextFormFieldWidget(
                controller: controller,
                hintText: hint,
                suffixIcon: suffixIcon,
                onPressedSuffixIcon: onPressedSuffixIcon,
                maxLines: 1,
                suffixText: suffixText,
                showVisibilityToggle: showVisibilityToggle!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
