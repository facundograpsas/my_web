import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_presentation/project.dart';
import 'package:my_presentation/widgets/desktop_widget.dart';
import 'package:my_presentation/widgets/mobile_widget.dart';


class DesktopAndMobileBox extends StatefulWidget {
  final DesktopAndMobileProject project;

  DesktopAndMobileBox({required this.project,
    Key? key,
  }) : super(key: key);


  @override
  _DesktopAndMobileBoxState createState() => _DesktopAndMobileBoxState();
}

class _DesktopAndMobileBoxState extends State<DesktopAndMobileBox> {

  Color currentColor = Colors.blue;
  int desktopIndex = 0;
  int mobileIndex = 0;

  late AssetImage currentDesktopImage;
  late AssetImage currentMobileImage;



  @override
  void initState() {
    currentDesktopImage = widget.project.desktopProject.images[desktopIndex];
    currentMobileImage = widget.project.mobileProject.images[mobileIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return
      FittedBox(
      child:Container(
      // width: 800,
      height: 850,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                // spreadRadius: 1,
                offset: Offset(1, 2),
                blurRadius: 5
            )
          ],
          // border: Border.all(color: Colors.black, width: 4),
          color: Colors.black87,
      ),
      child: Column(
        // clipBehavior: Clip.hardEdge,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top:50),
              child: Text("Desencajados",
              style: GoogleFonts.metrophobic(color: Colors.white,
              fontSize: 50),)),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Text("Proyecto personal",
            style: GoogleFonts.metrophobic(
                color: Colors.grey,
            fontSize: 30),)
          ),
          Row(
            children: [
              DesktopWidget(project: widget.project.desktopProject),
              MobileWidget(project: widget.project.mobileProject),

              // FittedBox(
              //   child: Container(
              //       width: 800,
              //       height: 500,
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage("assets/images/escritorio.png"),
              //             // fit: BoxFit.cover
              //           )
              //       ),
              //     child: Stack(
              //       children: [
              //         PositionedDirectional(
              //           top: 10,
              //           start: 150,
              //           width: 500,
              //           child: Container(
              //             width: 300,
              //             height: 300,
              //             // color: Colors.green,
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image: currentDesktopImage,
              //                 fit: BoxFit.cover
              //               )
              //             ),
              //           ),
              //         ),
              //         PositionedDirectional(
              //           end: 250,
              //           bottom: 130,
              //           child: Container(
              //               child: ElevatedButton(
              //                 child: Icon(Icons.arrow_forward,
              //                 color: Colors.black87,),
              //                   onPressed: (){
              //                     if(desktopIndex < widget.project.desktopProject.images.length-1)
              //                     setState(() {
              //                       desktopIndex++;
              //                       currentDesktopImage = widget.project.desktopProject.images[desktopIndex];
              //                     });
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                   primary: Colors.white60
              //                 )
              //               ),
              //         )
              //         ),
              //         PositionedDirectional(
              //           end: 500,
              //           bottom: 130,
              //           child: Container(
              //             child: ElevatedButton(
              //                 child: Icon(Icons.arrow_back,
              //                   color: Colors.black87,),
              //                 onPressed: (){
              //                   if(desktopIndex > 0)
              //                     setState(() {
              //                       desktopIndex--;
              //                     currentDesktopImage = widget.project.desktopProject.images[desktopIndex];
              //                     });
              //                 },
              //                 style: ElevatedButton.styleFrom(
              //                     primary: Colors.white60
              //                 )
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // FittedBox(
              //   child: Container(
              //     margin: EdgeInsets.only(bottom: 20),
              //     width: 800,
              //     height: 500,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage("assets/images/smartphone.png"),
              //           // fit: BoxFit.cover
              //         )
              //     ),
              //     child: Stack(
              //       children: [
              //         PositionedDirectional(
              //           top: 45,
              //           start: 262,
              //           width: 275,
              //           child: Container(
              //             width: 300,
              //             height: 380,
              //             // color: Colors.green,
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                     image: widget.project.mobileImages[mobileIndex],
              //                     fit: BoxFit.cover
              //                 )
              //             ),
              //           ),
              //         ),
              //         PositionedDirectional(
              //             end: 280,
              //             bottom: 30,
              //             child: Container(
              //               child: ElevatedButton(
              //                   child: Icon(Icons.arrow_forward,
              //                     color: Colors.black87,),
              //                   onPressed: (){
              //                     if(mobileIndex < widget.project.mobileImages.length-1)
              //                       setState(() {
              //                         mobileIndex++;
              //                         currentMobileImage = widget.project.mobileImages[mobileIndex];
              //
              //                       });
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                       primary: Colors.white60
              //                   )
              //               ),
              //             )
              //         ),
              //         PositionedDirectional(
              //           end: 460,
              //           bottom: 30,
              //           child: Container(
              //             child: ElevatedButton(
              //                 child: Icon(Icons.arrow_back,
              //                   color: Colors.black87,),
              //                 onPressed: (){
              //                   if(mobileIndex > 0)
              //                     setState(() {
              //                       mobileIndex--;
              //                       currentMobileImage = widget.project.mobileImages[mobileIndex];
              //                     });
              //                 },
              //                 style: ElevatedButton.styleFrom(
              //                     primary: Colors.white60
              //                 )
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    )
      );
  }
}