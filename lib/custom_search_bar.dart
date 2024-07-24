import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_text_styles.dart';
import 'package:daily_exercises_app/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.top,
    required this.left,
    required this.width,
  });

  final double top;
  final double left;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                hintText: AppTexts.searchHint,
                hintStyle: AppTextStyles.searchHint,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AppImages.search),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
