import 'package:education/pages/bookmark_page/bookmark_page.dart';
import 'package:education/pages/notification_page/notification_page.dart';
import 'package:education/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_page/home_page.dart';
import 'my_courses_page/my_courses_page.dart';

class BottomNavBarView extends StatefulWidget {
  static const String id = "bottom_nav_bar";

  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  PageController? _pageController;
  int? _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePage(),
          BookmarkPage(),
          MyCoursesPage(),
          NotificationPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex!,
        onTap: (index) {
          _currentIndex = index;
          _pageController!.animateToPage(index,
              duration: Duration(milliseconds: 100), curve: Curves.easeIn);
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(_currentIndex == 0 ? IconlyBold.home : IconlyLight.home),
            title: Text("Home"),
            selectedColor: Colors.blue,
          ),

          /// Bookmark
          SalomonBottomBarItem(
            icon: Icon(_currentIndex == 1
                ? IconlyBold.bookmark
                : IconlyLight.bookmark),
            title: Text("Bookmark"),
            selectedColor: Colors.blue,
          ),

          /// Courses
          SalomonBottomBarItem(
            icon: Icon(_currentIndex == 2 ? IconlyBold.work : IconlyLight.work),
            title: Text("Courses"),
            selectedColor: Colors.blue,
          ),

          /// Notification
          SalomonBottomBarItem(
            icon: Icon(_currentIndex == 3
                ? IconlyBold.notification
                : IconlyLight.notification),
            title: Text("Notification"),
            selectedColor: Colors.blue,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(
                _currentIndex == 4 ? IconlyBold.profile : IconlyLight.profile),
            title: Text("Profile"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
