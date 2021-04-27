import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    var screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen;
    if (screenWidth > 1000)
      isLargeScreen = true;
    else
      isLargeScreen = false;
    return Scaffold(
      // backgroundColor: Colors.black87,
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
                    // if (isLargeScreen)
                    NameCard(
                      fontSize: 50,
                      widthFactor: 0.5,
                    )
                    // else
                    //   NameCard(
                    //     fontSize: 30,
                    //     widthFactor: 0.8,
                    //   ),
                    ,
                    Container(
                      height: 800,
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          // height: 800.0,
                          // aspectRatio: 5/3,
                          viewportFraction: 0.6,
                        ),
                        // items: [[Colors.red,Colors.green],2,3,4,5].map((i) {
                        //   return Builder(
                        //     builder: (BuildContext context) {
                        //       return ProjectBox(project: i,);
                        //     },
                        //   );
                        // }).toList(),
                        items: projects
                            .map((project) =>
                                Builder(builder: (BuildContext context) {
                                  if(project is DesktopProject) return DesktopBox(project: project);
                                  else if(project is DesktopAndMobileProject) return DesktopAndMobileBox(project: project);
                                  else if(project is MobileProject) return MobileBox(project: project);
                                  else return ErrorWidget(Exception("No hay contendor para ese tipo"));
                                }))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
