import 'package:daily_exercises_app/constants/app_images.dart';
import 'package:daily_exercises_app/constants/app_colors.dart';
import 'package:daily_exercises_app/constants/app_texts.dart';
import 'package:daily_exercises_app/constants/app_text_styles.dart';
import 'package:daily_exercises_app/exercise.dart';
import 'package:daily_exercises_app/meditation_screen.dart';
import 'package:flutter/material.dart';

import 'background_image.dart';
import 'bottom_nav_bar.dart';
import 'custom_search_bar.dart';

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
  final List<Exercise> _exercises = [
    Exercise(
      imagePath: AppImages.diet,
      title: AppTexts.dietRecommendation,
    ),
    Exercise(
      imagePath: AppImages.exercise,
      title: AppTexts.kegelExercises,
    ),
    Exercise(
      imagePath: AppImages.meditation,
      title: AppTexts.medication,
    ),
    Exercise(
      imagePath: AppImages.yoga,
      title: AppTexts.yoga,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final maxHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(
            backgroundImage: AppImages.backgroundScreen1,
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
          Padding(
            padding: const EdgeInsets.only(top: 24.0, right: 16),
            child: Align(
              alignment: Alignment.topRight,
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
          ),
          const Positioned(
            top: 60,
            left: 36,
            child: Text(
              AppTexts.goodMorning,
              style: AppTextStyles.header,
            ),
          ),
          CustomSearchBar(
            top: maxHeight * 0.2,
            left: 40,
            width: maxWidth * 0.8,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: maxWidth * 0.84,
              height: maxHeight * 0.65,
              decoration: const BoxDecoration(),
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MeditationScreen()));
                    },
                    child: _buildOptionExerciseCard(
                      _exercises[index].title,
                      _exercises[index].imagePath,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

Widget _buildOptionExerciseCard(
  final String title,
  final String imagePath,
) {
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
        Flexible(
          flex: 3,
          child: Container(
            height: 120,
            padding: const EdgeInsets.only(top: 18),
            child: Image(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.exerciseTitle,
          ),
        ),
      ],
    ),
  );
}
