import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:daily_exercises_app/constants/app_texts.dart';
import 'package:daily_exercises_app/constants/app_text_styles.dart';
import 'package:daily_exercises_app/custom_header.dart';
import 'package:daily_exercises_app/meditation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bottom_nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {
      'imagePath': AppImages.diet,
      'title': AppTexts.dietRecommendation,
    },
    {
      'imagePath': AppImages.exercise,
      'title': AppTexts.kegelExercises,
    },
    {
      'imagePath': AppImages.meditation,
      'title': AppTexts.medication,
    },
    {
      'imagePath': AppImages.yoga,
      'title': AppTexts.yoga,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const CustomHeader(
                  backgroundColor: AppColors.backgroundColor,
                  svgColor: AppColors.svgExerciseColor,
                ),
                Positioned(
                  left: maxWidth * 0.95,
                  top: maxHeight * 0.3,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const ShapeDecoration(
                      color: AppColors.accentColor,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: maxWidth * 0.8,
                  top: maxHeight * 0.05,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.menu),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: maxWidth * 0.1,
                  top: maxHeight * 0.12,
                  child: const Text.rich(
                    TextSpan(
                      text: AppTexts.goodMorning,
                      style: AppTextStyles.header,
                    ),
                  ),
                ),
                Positioned(
                  left: maxWidth * 0.1,
                  top: maxHeight * 0.25,
                  child: Container(
                    width: maxWidth * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          hintText: AppTexts.searchHint,
                          hintStyle: AppTextStyles.searchHint,
                          prefixIcon: SizedBox(
                            height: 20,
                            child: SvgPicture.asset(
                              AppImages.search,
                              // width: 5,
                              // height: 5,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: maxWidth * 0.08,
                  top: maxHeight * 0.3,
                  child: Container(
                    width: maxWidth * 0.84,
                    height: 500,
                    decoration: const BoxDecoration(),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        if (index == 3) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MeditationScreen()));
                            },
                            child: OptionExerciseCard(
                              title: exercises[index]['title']!,
                              imagePath: exercises[index]['imagePath']!,
                              paddingImage: 36,
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MeditationScreen()));
                            },
                            child: OptionExerciseCard(
                              title: exercises[index]['title']!,
                              imagePath: exercises[index]['imagePath']!,
                              paddingImage: 18,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class OptionExerciseCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double paddingImage;
  const OptionExerciseCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.paddingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadowColor,
            blurRadius: 23,
            offset: Offset(0, 17),
            spreadRadius: -13,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: paddingImage),
            child: Image(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.exerciseTitle,
          ),
        ],
      ),
    );
  }
}
