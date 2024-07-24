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
      Container(
        width: maxWidth,
        height: maxHeight,
        decoration: BoxDecoration(color: backgroundColor),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: maxWidth,
          height: maxHeight * 0.5,
          decoration: const BoxDecoration(color: AppColors.headerLightGray),
        ),
      ),
      _SvgHeader(
        pathImage: AppImages.path1,
        widthBox: maxWidth * 0.75,
        heightBox: maxHeight * 0.1,
        svgColor: svgColor,
        paddingTop: maxHeight * 0.03,
      ),
      _SvgHeader(
        pathImage: AppImages.path2,
        widthBox: maxWidth * 0.77,
        heightBox: maxHeight * 0.2,
        svgColor: svgColor,
        paddingTop: maxHeight * 0.13,
      ),
    ]);
  }
}

class _SvgHeader extends StatelessWidget {
  const _SvgHeader({
    required this.pathImage,
    required this.widthBox,
    required this.heightBox,
    required this.svgColor,
    required this.paddingTop,
  });

  final String pathImage;
  final double widthBox;
  final double heightBox;
  final Color svgColor;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: widthBox,
          height: heightBox,
          child: SvgPicture.asset(
            fit: BoxFit.fill,
            pathImage,
            colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
/* 
Widget _buildSvgHeader(String pathImage, double widthBox, double heightBox,
    Color svgColor, double paddingTop) {
  return Padding(
    padding: EdgeInsets.only(top: paddingTop),
    child: Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: widthBox,
        height: heightBox,
        child: SvgPicture.asset(
          pathImage,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
        ),
      ),
    ),
  );
}
*/