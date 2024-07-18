import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:daily_exercises_app/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.today),
          label: AppTexts.today,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.gym),
          label: AppTexts.allExercises,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.settings),
          label: AppTexts.settings,
        ),
      ],
      currentIndex: 1,
      selectedItemColor: AppColors.bottomNavSelected,
      unselectedItemColor: AppColors.bottomNavUnselected,
    );
  }
}
