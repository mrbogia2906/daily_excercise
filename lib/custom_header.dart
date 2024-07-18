import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeader extends StatelessWidget {
  final Color backgroundColor;
  final Color svgColor;
  const CustomHeader({
    super.key,
    required this.backgroundColor,
    required this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Positioned(
        left: 0,
        top: 0,
        child: Container(
          width: maxWidth,
          height: maxHeight,
          decoration: BoxDecoration(color: backgroundColor),
        ),
      ),
      Positioned(
        left: 0,
        top: maxHeight * 0.45,
        child: Container(
          width: maxWidth,
          height: maxHeight,
          decoration: const BoxDecoration(color: AppColors.headerLightGray),
        ),
      ),
      Positioned(
        left: 0,
        top: maxHeight * 0.05,
        child: SizedBox(
          width: maxWidth * 0.75,
          height: maxHeight * 0.1,
          child: SvgPicture.asset(
            AppImages.path1,
            colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
          ),
        ),
      ),
      Positioned(
        left: -maxWidth * 0.04,
        top: maxHeight * 0.146,
        child: SizedBox(
          width: maxWidth * 0.85,
          height: maxHeight * 0.2,
          child: SvgPicture.asset(
            AppImages.path2,
            colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
          ),
        ),
      ),
    ]);
  }
}
