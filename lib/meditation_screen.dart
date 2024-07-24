import 'package:daily_exercises_app/background_image.dart';
import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:daily_exercises_app/constants/app_texts.dart';
import 'package:daily_exercises_app/constants/app_text_styles.dart';
import 'package:daily_exercises_app/bottom_nav_bar.dart';
import 'package:daily_exercises_app/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(
              backgroundImage: AppImages.backgroundScreen2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(AppImages.meditationSvg)),
            ),
            Positioned(
              left: maxWidth * 0.08,
              top: maxHeight * 0.05,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppTexts.meditationTitle,
                      style: AppTextStyles.meditationHeader,
                    ),
                    TextSpan(
                      text: AppTexts.meditationSubtitle,
                      style: AppTextStyles.meditationSubtitle,
                    ),
                    TextSpan(
                      text: AppTexts.meditationDescription,
                      style: AppTextStyles.meditationDescription,
                    ),
                  ],
                ),
              ),
            ),
            CustomSearchBar(
              top: maxHeight * 0.25,
              left: 20,
              width: maxWidth * 0.5,
            ),
            Positioned(
              left: maxWidth * 0.05,
              top: maxHeight * 0.3,
              child: Container(
                width: maxWidth * 0.9,
                height: 500,
                decoration: const BoxDecoration(),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: _buildOptionMeditaionSection(index),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: maxWidth * 0.08,
              bottom: maxHeight * 0.15,
              child: const Text(
                AppTexts.meditationTitle,
                style: AppTextStyles.meditationBasicsTitle,
              ),
            ),
            Positioned(
              left: maxWidth * 0.05,
              top: maxHeight * 0.78,
              child: Container(
                width: maxWidth * 0.9,
                height: 89,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: AppColors.cardShadowColor,
                      blurRadius: 23,
                      offset: Offset(0, 17),
                      spreadRadius: -13,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(AppImages.meditation),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTexts.meditationBasics,
                            style: AppTextStyles.meditationBasicsTitle,
                          ),
                          Text(
                            AppTexts.meditationBasicsSubtitle,
                            style: AppTextStyles.meditationBasicsSubtitle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, right: 20),
                      child: SvgPicture.asset(AppImages.lock),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}

Widget _buildOptionMeditaionSection(final int index) {
  String imagePath = index == 0 ? AppImages.play : AppImages.unplay;

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: AppColors.cardShadowColor,
          blurRadius: 23,
          offset: Offset(0, 17),
          spreadRadius: -13,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imagePath)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '${AppTexts.meditationSection} 0${index + 1}',
                style: AppTextStyles.meditationSectionTitle,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
