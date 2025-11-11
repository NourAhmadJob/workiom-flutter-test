import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widgets/image_widget.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
import '../utils/images.dart';

class TextFormFieldWidget extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final String? title;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final TextStyle? labelStyle;
  final String? labelText;
  final bool? isObscureText;
  final bool? isBox;
  final String? suffixIcon;
  final String? prefixIcon;
  final TextAlign? isleft;
  final Color? backgroundColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmitted;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final int? maxLines;
  final int? maxLength;
  final Function()? onPressedSuffixIcon;
  final Function()? onPressedPrefixIcon;

  final BorderRadius? borderRadius;
  final Color? borderColor;
  final bool showVisibilityToggle;
  final String? Function(String?)? customValidator;

  final List<TextInputFormatter>? inputFormatters;
  final bool enforceDigitsOnly;
  final int? hardMaxLength;
  final String? suffixText;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.labelStyle,
    required this.hintText,
    this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.isBox,
    this.readOnly,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.title,
    this.keyboardType,
    this.isleft,
    this.maxLines,
    this.maxLength,
    this.borderRadius,
    this.borderColor,
    this.showVisibilityToggle = false,
    this.customValidator,
    this.onPressedSuffixIcon,
    this.inputFormatters,
    this.enforceDigitsOnly = false,
    this.hardMaxLength,
    this.prefixIcon,
    this.onPressedPrefixIcon,
    this.suffixText
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordField = isObscureText == true || showVisibilityToggle;
    final obscureText = isPasswordField ? ValueNotifier<bool>(true) : null;

    final computedFormatters = <TextInputFormatter>[
      if (enforceDigitsOnly) FilteringTextInputFormatter.digitsOnly,
      if (hardMaxLength != null)
        LengthLimitingTextInputFormatter(hardMaxLength),
      ...?inputFormatters,
    ];

    return ValueListenableBuilder<bool>(
      valueListenable: obscureText ?? ValueNotifier<bool>(false),
      builder: (context, isObscured, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Text(title!, style: getRegularStyle(fontSize: 15.sp)),
            15.verticalSpace,
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: maxLength,
              maxLines: maxLines,
              textAlign: isleft ?? TextAlign.start,
              readOnly: readOnly ?? false,
              keyboardType: keyboardType ?? TextInputType.text,
              cursorColor: AppColors.primary,
              controller: controller,
              inputFormatters: computedFormatters.isEmpty
                  ? null
                  : computedFormatters,
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                suffixText: suffixText,
                suffixStyle: getRegularStyle(fontSize: 15.sp,color: AppColors.greySuffixTitle),
                prefixIcon: prefixIcon != null
                    ? SizedBox(
                        width: 16.w,
                        height: 16.h,
                        child: SvgImageWidget(
                          image: prefixIcon!,
                          width: 16.w,
                          height: 16.h,
                        ),
                      )
                    : null,
                contentPadding:
                    contentPadding ??
                    EdgeInsets.only(bottom: 8.h , top: 16.h),
                hintStyle:
                    hintStyle ??
                    getRegularStyle(
                      fontSize: 15.sp,
                      color: AppColors.greyTitle,
                    ),
                hintText: hintText,
                labelText: labelText,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 20.w,
                  minHeight: 20.h,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                suffixIcon: isPasswordField
                    ? InkWell(
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: SvgImageWidget(
                              image: SvgImages.show,
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (obscureText != null) {
                            obscureText.value = !obscureText.value;
                          }
                        },
                      )
                    : suffixIcon != null
                    ? InkWell(
                        onTap: onPressedSuffixIcon,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: SizedBox(
                            width: 16.w,
                            height: 16.h,
                            child: SvgImageWidget(
                              image: suffixIcon!,
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                        ),
                      )
                    : null,
                fillColor: backgroundColor ?? Colors.white,
                filled: true,
              ),
              obscureText: isPasswordField
                  ? isObscured
                  : (isObscureText ?? false),
              obscuringCharacter: '*',
              style: getRegularStyle(fontSize: 15.sp, color: AppColors.black),
              validator: (value) {
                if (customValidator != null) return customValidator!(value);
                if (validator != null) return validator!(value);
                return null;
              },
              onChanged: onChanged,
              onTap: onTap,
              onFieldSubmitted: onFieldSubmitted,
            ),
          ],
        );
      },
    );
  }
}
