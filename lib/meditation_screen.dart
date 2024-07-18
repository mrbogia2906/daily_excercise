import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:daily_exercises_app/constants/app_texts.dart';
import 'package:daily_exercises_app/constants/app_text_styles.dart';
import 'package:daily_exercises_app/bottom_nav_bar.dart';
import 'package:daily_exercises_app/custom_header.dart';
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
            const CustomHeader(
              backgroundColor: AppColors.meditationBackground,
              svgColor: AppColors.svgMeditationColor,
            ),
            Positioned(
              left: maxWidth * 0.6,
              top: maxHeight * 0.02,
              child: Container(
                width: 200,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.meditation),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: maxWidth * 0.1,
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
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: maxWidth * 0.05,
              top: maxHeight * 0.25,
              child: Container(
                width: maxWidth * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      hintText: AppTexts.searchHint,
                      hintStyle: AppTextStyles.searchHint,
                      prefixIcon: Icon(
                        size: 35,
                        Icons.search,
                        color: AppColors.searchIconColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: maxWidth * 0.05,
              top: maxHeight * 0.33,
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
                    if (index == 0) {
                      return OptionMeditaionSection(
                        imagePath: AppImages.play,
                        index: index + 1,
                      );
                    } else {
                      return OptionMeditaionSection(
                        imagePath: AppImages.unplay,
                        index: index + 1,
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              left: maxWidth * 0.1,
              top: maxHeight * 0.75,
              child: const Text(
                AppTexts.meditationTitle,
                style: AppTextStyles.meditationBasicsTitle,
              ),
            ),
            Positioned(
                left: maxWidth * 0.05,
                top: maxHeight * 0.79,
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
                )),
          ],
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}

class OptionMeditaionSection extends StatelessWidget {
  final String imagePath;
  final int index;
  const OptionMeditaionSection({
    super.key,
    required this.imagePath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
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
                    '${AppTexts.meditationSection} 0$index',
                    style: AppTextStyles.meditationSectionTitle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
