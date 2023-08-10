import 'package:flutter/material.dart';

import '../colors.dart';

class CousesView extends StatelessWidget {
  CousesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _container(
            "assets/images/happy.png",
            MyColors.myBlue,
            "Biology",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "70"),
        _container(
            "assets/images/reading.png",
            MyColors.myOrange,
            "Biology",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "70"),
        _container(
            "assets/images/greengirl.png",
            MyColors.myGreen,
            "Biology",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "70"),
        _container(
            "assets/images/readme.png",
            MyColors.myTeal,
            "Mathematics",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "70"),
        SizedBox(height: 250,),
      ],
    );
  }

  Widget _container(
    image,
    color,
    subjectName,
    description,
    complatedPercentage,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Complated $complatedPercentage%",
                    style: const TextStyle(
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
