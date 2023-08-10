import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../sign_in_up_pages/sign_in_page.dart';
import 'intro_page.dart';

class LiquidSwipeView extends StatelessWidget {
  static const String id = "liquid_swipe";

  LiquidSwipeView({Key? key}) : super(key: key);

  final _pages = [
    IntroPage(
        title1: "Bilimlar tog'iga",
        title2: "Birgalikda chiqamiz",
        color: const Color(0xffD8C4B6),
        image: "assets/images/hiking.png",
        currentIndex: 0),
    IntroPage(
        title1: "Eng tajribali ustozlardan",
        title2: "Bilim olamiz",
        color: const Color(0xffF5EFE7),
        image: "assets/images/remote_lesson.png",
        currentIndex: 1),
    IntroPage(
        title1: "Berilgan topshiriqlarni",
        title2: "Sidqidildan bajaramiz",
        color: const Color(0xffD8C4B6),
        image: "assets/images/doing_tasks.png",
        currentIndex: 2),
    IntroPage(
        title1: "Eng nufuzli universitetlar",
        title2: "Talabasiga aylanamiz",
        color: const Color(0xffF5EFE7),
        image: "assets/images/achieving_goals.png",
        currentIndex: 3),
    SignInPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        initialPage: 0,
        onPageChangeCallback: (int pageIndex) {},
        pages: _pages,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios,
          size: 30,
        ),
        positionSlideIcon: 0.5,
        waveType: WaveType.liquidReveal,
        //fullTransitionValue: 300,
        enableLoop: false,
        enableSideReveal: true,
      ),
    );
  }
}
