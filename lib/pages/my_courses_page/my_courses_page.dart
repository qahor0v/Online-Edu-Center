import 'package:education/pages/colors.dart';
import 'package:education/pages/one_couse_page/one_course_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../getx_controllers/tabbar_index.dart';
import 'courses_view.dart';

class MyCoursesPage extends StatefulWidget {
  static const String id = "courses_page";

  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    TabBarIndexController controller = Get.put(TabBarIndexController());
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(IconlyLight.arrow_left),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, OneCoursePage.id);
            },
            icon: const Icon(IconlyLight.search),
          )
        ],
        title: Text(
          "My Courses",
          style: TextStyle(color: MyColors.textColor),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TabBar(
                labelPadding: EdgeInsets.only(right: 20),
                indicatorColor: Colors.transparent,
                onTap: (int myIndex) {
                  setState(() {
                    controller.changeValue(myIndex);
                  });
                },
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 20, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: controller.index == 0
                            ? MyColors.myBlue
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: controller.index == 0
                                ? Colors.white
                                : MyColors.myBlue,
                            child: Icon(
                              IconlyLight.document,
                              color: controller.index == 0
                                  ? MyColors.myBlue
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "All",
                            style: TextStyle(
                                color: controller.index == 0
                                    ? Colors.white
                                    : MyColors.textColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 20, top: 8, bottom: 8),

                      //height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: controller.index == 1
                            ? MyColors.myBlue
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: controller.index == 1
                                ? Colors.white
                                : MyColors.myOrange,
                            child: Icon(
                              IconlyLight.game,
                              color: controller.index == 1
                                  ? MyColors.myBlue
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Ongoing",
                            style: TextStyle(
                                color: controller.index == 1
                                    ? Colors.white
                                    : MyColors.textColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 20, top: 8, bottom: 8),
                      //height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: controller.index == 2
                            ? MyColors.myBlue
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: controller.index == 2
                                ? Colors.white
                                : MyColors.myTeal,
                            child: Icon(
                              IconlyLight.tick_square,
                              color: controller.index == 2
                                  ? MyColors.myBlue
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Complate",
                            style: TextStyle(
                                color: controller.index == 2
                                    ? Colors.white
                                    : MyColors.textColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: _height,
                child: TabBarView(children: [
                  CousesView(),
                  CousesView(),
                  CousesView(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _container(image, color, subjectName, description, complated) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Complated $complated%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
