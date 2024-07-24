import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.backgroundImage,
  });

  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: size.height * 0.5,
            decoration: const BoxDecoration(color: AppColors.headerLightGray),
          ),
        ),
      ],
    );
  }
}
