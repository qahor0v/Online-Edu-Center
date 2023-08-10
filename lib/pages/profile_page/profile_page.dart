import 'package:education/pages/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatelessWidget {
  static const String id = "profile_page";

  const ProfilePage({Key? key}) : super(key: key);

  /// this alert dialog for choosing "Language" section
  void _androiDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            title: Text(
              "Language",
              style: TextStyle(
                color: MyColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Container(
                //color: Colors.red,
                width: double.infinity,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        print("xfxfsbdf");
                      },
                      child: const Text(
                        "Uzbek",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("xfxfsbdf");
                      },
                      child: const Text(
                        "Russian",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("xfxfsbdf");
                      },
                      child: const Text(
                        "English",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  /// this alert dialog for choosing "About Us" section
  void _aboutUsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.start,
          title: Text(
            "About us",
            style: TextStyle(
              color: MyColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              width: double.infinity,
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  /// this alert dialog for choosing "Contact" section
  void _contactDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            title: Text(
              "Contacts",
              style: TextStyle(
                color: MyColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Our phone numbers",style: TextStyle(fontWeight: FontWeight.bold),),
                    TextButton(
                      onPressed: () {
                        print("xfxfsbdf");
                      },
                      child: const Text(
                        "+9890-359-15-27",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Text("Our telegram contact",style: TextStyle(fontWeight: FontWeight.bold),),
                    TextButton(
                      onPressed: () {
                        print("xfxfsbdf");
                      },
                      child: const Text(
                        "https://t.me/devFlCy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Text("Our email",style: TextStyle(fontWeight: FontWeight.bold),),
                    TextButton(
                      onPressed: () {
                        print("xfxfsbdf");
                      },
                      child: const Text(
                        "ronaldrask1@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.myTeal.withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.3,
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.myBlue,
                          image: const DecorationImage(
                            image: AssetImage("assets/images/man_profile.png"),
                            //fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Muhammad Togoyev",
                        style: TextStyle(
                          color: MyColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "ronaldrask1@gmail.com",
                        style: TextStyle(
                          color: MyColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "+99890-359-15-27",
                        style: TextStyle(
                          color: MyColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColors.myBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            IconlyBold.wallet,
                            color: MyColors.myBlue,
                          ),
                        ),
                        onTap: () {},
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Balance"),
                            Text(
                              "300.000 so'm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.textColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            IconlyBold.chat,
                            color: MyColors.myTeal,
                          ),
                        ),
                        onTap: () {},
                        title: Text("Chat"),
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.language,
                            color: MyColors.myOrange,
                          ),
                        ),
                        onTap: () {
                          _androiDialog(context);
                        },
                        title: Text("Language"),
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            IconlyBold.danger,
                            color: MyColors.myGreen,
                          ),
                        ),
                        onTap: () {
                          _aboutUsDialog(context);
                        },
                        title: Text("About us"),
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            IconlyBold.setting,
                            color: MyColors.myOlive,
                          ),
                        ),
                        onTap: () {},
                        title: Text("Change phone / email"),
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.phone,
                            color: MyColors.myOrange,
                          ),
                        ),
                        onTap: () {
                          _contactDialog(context);
                        },
                        title: Text("Contact"),
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Icon(
                            Icons.mode_night,
                            color: MyColors.myTeal,
                          ),
                        ),
                        onTap: () {},
                        title: Text("Change mode"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
