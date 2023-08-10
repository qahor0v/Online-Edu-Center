import 'package:education/pages/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class OneCoursePage extends StatelessWidget {
  static const String id = "one_course_page";

  OneCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: MyColors.myBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(IconlyLight.arrow_left),
            ),
            title: Text(
              "Mathematics",
              style: TextStyle(
                  color: MyColors.textColor, fontWeight: FontWeight.bold),
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(15),
                child: CircleAvatar(
                  backgroundColor: MyColors.myOrange,
                  child: const Icon(
                    IconlyBold.heart,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              )
            ],
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _headingContainer(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: screenHeight * 0.1 * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight * 0.1 * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: MyColors.myOrange,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Playlist",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.4),
                                ),
                                child: const Text(
                                  "17",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: MyColors.textColor,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    _playlistContainer(
                        "Introduction Introduction Introduction Introduction Introduction ",
                        "06:25 / 17:45"),
                    _playlistContainer("Trigonometry", "06:25 / 17:45"),
                    _playlistContainer("Stereometry", "06:25 / 17:45"),
                    _playlistContainer("Geometry", "06:25 / 17:45"),
                    _playlistContainer("Geometry", "06:25 / 17:45"),
                    _playlistContainer("Geometry", "06:25 / 17:45"),
                    _playlistContainer("Geometry", "06:25 / 17:45"),
                    _playlistContainer("Geometry", "06:25 / 17:45"),
                  ],
                )),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: screenHeight * 0.1,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: MyColors.myOrange,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child:
                                Icon(Icons.shopify, color: MyColors.myOrange),
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            "\$32.52",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: screenHeight * 0.1 * 0.8,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.myBlue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("Buy Now"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _headingContainer() {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/subjects/math.png"),
            )),
          )),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: MyColors.myBlue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.only(right: 10),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {},
                            icon: const Icon(IconlyBold.play),
                          ),
                          Text(
                            "06:25 / 17:45",
                            style: TextStyle(
                                color: MyColors.textColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.only(right: 10),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {},
                            icon: const Icon(
                              IconlyBold.volume_up,
                              size: 25,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(right: 10),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.fullscreen,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _playlistContainer(topic, duration) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            color: MyColors.myBlue,
            iconSize: 40,
            onPressed: () {},
            icon: const Icon(IconlyBold.play),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    topic,
                    style: TextStyle(
                      color: MyColors.textColor,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(right: 10),
            color: MyColors.myBlue,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(IconlyBold.unlock),
          ),
        ],
      ),
    );
  }
}
