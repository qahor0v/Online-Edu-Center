import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  static const String id = "intro1";
  String title1;
  String title2;
  Color color;
  String image;
  int currentIndex;

  IntroPage({
    Key? key,
    required this.title1,
    required this.title2,
    required this.color,
    required this.image,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: const TextStyle(
                        fontSize: 28,
                        fontFamily: "BreeSerif",
                        color: Color(0xff213555)),
                  ),
                  Text(
                    title2,
                    style: const TextStyle(
                        fontSize: 32,
                        fontFamily: "BreeSerif",
                        color: Color(0xff213555)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Image(image: AssetImage(image)),
          ],
        ),
      ),
    );
  }

  /// indicator count
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  /// indicator point
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Color(0xff213555), borderRadius: BorderRadius.circular(5)),
    );
  }
}
