import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageWidget extends StatelessWidget {
  const SvgImageWidget({
    super.key,
    required this.image,
    this.height = 22,
    this.width = 22,
    this.color,
  });

  final String image;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      color: color,
      fit: BoxFit.scaleDown,
    );
  }
}
