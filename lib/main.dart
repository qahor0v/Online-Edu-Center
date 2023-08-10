import 'package:education/pages/bookmark_page/bookmark_page.dart';
import 'package:education/pages/bottom_navbar_view.dart';
import 'package:education/pages/home_page/home_page.dart';
import 'package:education/pages/intro_pages/liquid_swipe_view.dart';
import 'package:education/pages/notification_page/notification_page.dart';
import 'package:education/pages/one_couse_page/one_course_page.dart';
import 'package:education/pages/profile_page/profile_page.dart';
import 'package:education/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:education/pages/sign_in_up_pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignInPage(),
      routes: {
        LiquidSwipeView.id: (context) => LiquidSwipeView(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        BottomNavBarView.id: (context) => BottomNavBarView(),
        HomePage.id: (context) => HomePage(),
        OneCoursePage.id: (context) => OneCoursePage(),
        BookmarkPage.id: (context) => BookmarkPage(),
        NotificationPage.id: (context) => NotificationPage(),
        ProfilePage.id: (context) => ProfilePage(),
      },
    );
  }
}
