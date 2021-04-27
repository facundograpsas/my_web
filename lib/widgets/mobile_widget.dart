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
        margin: EdgeInsets.only(bottom: 20),
        width: 800,
        height: 500,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/smartphone.png"),
              // fit: BoxFit.cover
            )
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              top: 45,
              start: 262,
              width: 276,
              child: Container(
                width: 300,
                height: 380,
                // color: Colors.green,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: widget.project.images[mobileIndex],
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
                        if(mobileIndex < widget.project.images.length-1)
                          setState(() {
                            mobileIndex++;
                            currentMobileImage = widget.project.images[mobileIndex];

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
                      if(mobileIndex > 0)
                        setState(() {
                          mobileIndex--;
                          currentMobileImage = widget.project.images[mobileIndex];
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
