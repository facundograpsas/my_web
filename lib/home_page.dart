import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_presentation/project.dart';
import 'package:my_presentation/widgets/mobile_box.dart';
import 'package:my_presentation/widgets/name_card.dart';
import 'package:my_presentation/widgets/desktop_box.dart';
import 'package:my_presentation/widgets/desktop_mobile_box.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    var screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen;
    if (screenWidth > 1000)
      isLargeScreen = true;
    else
      isLargeScreen = false;
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/darkbg.jpg"),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      if (isLargeScreen)
                        createNameCard(width: 800)
                      else
                        createNameCard(width: 370),
                      if (isLargeScreen)
                        createCarousel(height: 780, viewportFraction: 0.6)
                      else
                        createCarousel(height: 500, viewportFraction: 1.toDouble())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget createNameCard({required double width}) {
    return NameCard(
      widthFactor: width,
    );
  }

  Widget createCarousel({required double height, required viewportFraction}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: height,
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1 / 1,
          viewportFraction: viewportFraction,
        ),
        items: projects
            .map((project) => Builder(builder: (BuildContext context) {
              print("inside carousel builder");
                  if (project is DesktopProject)
                    return DesktopBox(project: project);
                  else if (project is DesktopAndMobileProject)
                    return DesktopAndMobileBox(project: project);
                  else if (project is MobileProject)
                    return MobileBox(project: project);
                  else
                    return ErrorWidget(
                      Exception("Error")
                    );
                }))
            .toList(),
      ),
    );
  }
}
