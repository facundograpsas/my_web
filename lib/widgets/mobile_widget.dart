import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_presentation/project.dart';

class MobileWidget extends StatefulWidget {

  final MobileProject project;

  MobileWidget({required this.project});

  @override
  _MobileWidgetState createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  late int mobileIndex;
  late AssetImage currentMobileImage;


  @override
  void initState() {
    mobileIndex = 0;
    currentMobileImage = widget.project.images[mobileIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(bottom: 1),
        width: 800,
        height: 600,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/smartphone6.png"),
              // fit: BoxFit.cover
            )
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              top: 65,
              start: 258,
              width: 278,
              child: Container(
                width: 300,
                height: 455,
                // color: Colors.green,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: currentMobileImage,
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            PositionedDirectional(
                end: 280,
                bottom: 30,
                child: Container(
                  child: ElevatedButton(
                      child: Icon(Icons.arrow_forward,
                        color: Colors.black87,),
                      onPressed: (){
                        setState(() {currentMobileImage = AssetImage("assets/images/tvnoise.gif");});

                        if(mobileIndex < widget.project.images.length-1) mobileIndex++;
                        else mobileIndex = 0;

                        Future.delayed(Duration(milliseconds: 200), () {
                          setState(() {
                            currentMobileImage = widget.project.images[mobileIndex];
                          });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white60
                      )
                  ),
                )
            ),
            PositionedDirectional(
              end: 460,
              bottom: 30,
              child: Container(
                child: ElevatedButton(
                    child: Icon(Icons.arrow_back,
                      color: Colors.black87,),
                    onPressed: (){
                      setState(() {currentMobileImage = AssetImage("assets/images/tvnoise.gif");});

                      if(mobileIndex > 0) mobileIndex--;
                      else mobileIndex = widget.project.images.length-1;

                      Future.delayed(Duration(milliseconds: 200), () {
                        setState(() {
                          currentMobileImage = widget.project.images[mobileIndex];
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white60
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
