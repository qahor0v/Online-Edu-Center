import 'package:education/pages/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkPage extends StatelessWidget {
  static const String id = "bookmark_page";

  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks",style: TextStyle(color: MyColors.textColor,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/empty_page.png"))),
        ),
      ),
    );
  }
}
