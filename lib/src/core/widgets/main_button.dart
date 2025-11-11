import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';
import '../utils/functions.dart';


class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
        required this.text,
        required this.onPress,
        this.height,
        this.width,
        this.horizontalMargin,
        this.style,
        this.borderRadius,
        this.buttonColor,
        this.textColor,
        this.margin,
        this.fontSize,
        this.isLiner = false,
        this.withBorder = false,
        this.borderColor,
        this.widget,
        this.isLoading =false
      });

  final String text;
  final VoidCallback? onPress;
  double? height;
  double? width;
  double? borderRadius;
  double? horizontalMargin;
  Color? textColor;
  Color? buttonColor;
  Color? borderColor;
  TextStyle? style;
  bool isLiner;
  bool withBorder;
  double? fontSize;
  bool? isLoading;
  EdgeInsetsGeometry? margin;
  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onPress!();
      },
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50.h,
        alignment: Alignment.center,
        margin: margin,
        decoration: BoxDecoration(
          border: withBorder
              ? Border.all(color: borderColor ?? AppColors.primary)
              : null,
          color: buttonColor ?? AppColors.primary,
          borderRadius:
          BorderRadius.circular(borderRadius?.r ?? 16.r),
        ),
        child: isLoading!? setupSpinKitWidget(): widget ?? Text(
          text,
          textAlign: TextAlign.center,
          style: style ??
              getMediumStyle(
                  color: textColor ?? AppColors.white,
                  fontSize: fontSize ?? 15.sp),
        ),
      ),
    );
  }
}
