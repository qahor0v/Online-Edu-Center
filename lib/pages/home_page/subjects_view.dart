import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SubjectsView extends StatelessWidget {
  Color color;
  String subjectImage;
  String subjectName;
  String teacherName;
  String subjectDuration;
  String numberOfFiles;

  SubjectsView({
    Key? key,
    required this.color,
    required this.subjectImage,
    required this.subjectName,
    required this.teacherName,
    required this.subjectDuration,
    required this.numberOfFiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _heightSize = MediaQuery.of(context).size.height;
    final _widthSize = MediaQuery.of(context).size.width;

    return Container(
      height: _heightSize * 0.4,
      width: _widthSize * 0.6,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(subjectImage),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subjectName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Created by $teacherName",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      //fontWeight: FontWeight.w800
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              IconlyBold.document,
                              color: color,
                            ),
                          ),
                          Text(
                            "$numberOfFiles Files",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              IconlyBold.time_circle,
                              color: color,
                            ),
                          ),
                          Text(
                            "$subjectDuration min",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
