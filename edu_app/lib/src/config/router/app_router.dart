import 'package:education/src/ui/pages/bookmark_page/bookmark_page.dart';
import 'package:education/src/ui/pages/bottom_navbar_view.dart';
import 'package:education/src/ui/pages/home_page/home_page.dart';
import 'package:education/src/ui/pages/intro_pages/liquid_swipe_view.dart';
import 'package:education/src/ui/pages/notification_page/notification_page.dart';
import 'package:education/src/ui/pages/one_couse_page/one_course_page.dart';
import 'package:education/src/ui/pages/profile_page/profile_page.dart';
import 'package:education/src/ui/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:education/src/ui/pages/sign_in_up_pages/sign_up_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes(BuildContext context) =>
    <String, WidgetBuilder>{
      LiquidSwipeView.id: (context) => LiquidSwipeView(),
      SignInPage.id: (context) => SignInPage(),
      SignUpPage.id: (context) => SignUpPage(),
      BottomNavBarView.id: (context) => const BottomNavBarView(),
      HomePage.id: (context) => HomePage(),
      OneCoursePage.id: (context) => OneCoursePage(),
      BookmarkPage.id: (context) => const BookmarkPage(),
      NotificationPage.id: (context) => const NotificationPage(),
      ProfilePage.id: (context) => const ProfilePage(),
    };
