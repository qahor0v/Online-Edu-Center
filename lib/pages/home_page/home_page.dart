import 'package:education/pages/colors.dart';
import 'package:education/pages/home_page/subjects_view.dart';
import 'package:education/pages/one_couse_page/one_course_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../getx_controllers/courses_button_index.dart';


class HomePage extends StatefulWidget {
  static const String id = "home_page";

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    CoursesButtonIndexController controller =
        Get.put(CoursesButtonIndexController());
    final _heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myBackground,
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          /// Hello
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(fontSize: 16, color: MyColors.textColor),
                    ),
                    Text(
                      "Alonzo Lee",
                      style: TextStyle(fontSize: 26, color: MyColors.textColor),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/images/man_profile.png",
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                )
              ],
            ),
          ),

          /// Search
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (data) {},
                                style: const TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconlyLight.search,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff52c2ff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.setting,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),

          /// courses text
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Courses",
              style: TextStyle(
                  fontSize: 22,
                  color: MyColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Obx(()=>Padding(
            padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Column(
              children: [
                /// courses items
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.changeValue(1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: controller.buttonIndex.value == 1
                                ? Color(0xff52c2ff)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: controller.buttonIndex.value == 1
                                    ? Colors.white
                                    : Color(0xff52c2ff),
                                radius: 20,
                                child: Icon(
                                  Icons.local_fire_department_outlined,
                                  color: controller.buttonIndex.value == 1
                                      ? Colors.blue
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Barchasi",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: controller.buttonIndex.value == 1
                                      ? Colors.white
                                      : MyColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.changeValue(2);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: controller.buttonIndex.value == 2
                                ? Color(0xff52c2ff)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: controller.buttonIndex.value == 2
                                    ? Colors.white
                                    : Color(0xfff9ae2b),
                                radius: 20,
                                child: Icon(
                                  Icons.local_fire_department_outlined,
                                  color: controller.buttonIndex.value == 2
                                      ? Colors.blue
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Mashhurlari",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: controller.buttonIndex.value == 2
                                      ? Colors.white
                                      : MyColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.changeValue(3);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: controller.buttonIndex.value == 3
                                ? Color(0xff52c2ff)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: controller.buttonIndex.value == 3
                                    ? Colors.white
                                    : Color(0xff7280b3),
                                radius: 20,
                                child: Icon(
                                  Icons.local_fire_department_outlined,
                                  color: controller.buttonIndex.value == 3
                                      ? Colors.blue
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Yangilari",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: controller.buttonIndex.value == 3
                                      ? Colors.white
                                      : MyColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.changeValue(4);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: controller.buttonIndex.value == 4
                                ? Color(0xff52c2ff)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: controller.buttonIndex.value == 4
                                    ? Colors.white
                                    : Colors.green,
                                radius: 20,
                                child: Icon(
                                  Icons.local_fire_department_outlined,
                                  color: controller.buttonIndex.value == 4
                                      ? Colors.blue
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Advance",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: controller.buttonIndex.value == 4
                                      ? Colors.white
                                      : MyColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                /// subjects view
                Container(
                  height: _heightSize * 0.4,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>OneCoursePage());
                        },
                        child: SubjectsView(
                            color: MyColors.myBlue,
                            subjectImage: "assets/images/subjects/math.png",
                            subjectName: "Mathematics",
                            teacherName: "Sirojiddin",
                            subjectDuration: "17",
                            numberOfFiles: "40"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>OneCoursePage());
                        },
                        child: SubjectsView(
                            color: MyColors.myOrange,
                            subjectImage: "assets/images/subjects/physics.png",
                            subjectName: "Physics",
                            teacherName: "Sirojiddin",
                            subjectDuration: "17",
                            numberOfFiles: "40"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>OneCoursePage());
                        },
                        child: SubjectsView(
                            color: MyColors.myTeal,
                            subjectImage: "assets/images/subjects/bio.png",
                            subjectName: "Biology",
                            teacherName: "Sirojiddin",
                            subjectDuration: "17",
                            numberOfFiles: "40"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>OneCoursePage());
                        },
                        child: SubjectsView(
                            color: MyColors.myOlive,
                            subjectImage: "assets/images/subjects/english.png",
                            subjectName: "English",
                            teacherName: "Sirojiddin",
                            subjectDuration: "17",
                            numberOfFiles: "40"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>OneCoursePage());
                        },
                        child: SubjectsView(
                            color: MyColors.myGreen,
                            subjectImage:
                            "assets/images/subjects/chemistry.png",
                            subjectName: "Chemistry",
                            teacherName: "Sirojiddin",
                            subjectDuration: "17",
                            numberOfFiles: "40"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }
}
