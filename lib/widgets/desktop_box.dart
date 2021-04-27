import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_presentation/project.dart';


class DesktopBox extends StatefulWidget {
  final DesktopProject project;

  DesktopBox({required this.project,
    Key? key,
  }) : super(key: key);


  @override
  _DesktopBoxState createState() => _DesktopBoxState();
}

class _DesktopBoxState extends State<DesktopBox> {

  Color currentColor = Colors.blue;
  int index = 0;
  late AssetImage currentImage;


  @override
  void initState() {
    currentImage = widget.project.images[index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      FittedBox(
      child:Container(
      // width: 800,
      // height: 500,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top:30),
              child: Text("Desencajados",
              style: GoogleFonts.metrophobic(color: Colors.white,
              fontSize: 30),)),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text("Proyecto personal",
            style: GoogleFonts.metrophobic(
                color: Colors.grey,
            fontSize: 18),)
          ),
          FittedBox(
            child: Container(
                width: 800,
                height: 500,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/escritorio.png"),
                      // fit: BoxFit.cover
                    )
                ),
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: 10,
                    start: 150,
                    width: 500,
                    child: Container(
                      width: 300,
                      height: 300,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: widget.project.images[index],
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 250,
                    bottom: 130,
                    child: Container(
                        child: ElevatedButton(
                          child: Icon(Icons.arrow_forward,
                          color: Colors.black87,),
                            onPressed: (){
                              if(index < widget.project.images.length-1)
                              setState(() {
                                index++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white60
                          )
                        ),
                  )
                  ),
                  PositionedDirectional(
                    end: 500,
                    bottom: 130,
                    child: Container(
                      child: ElevatedButton(
                          child: Icon(Icons.arrow_back,
                            color: Colors.black87,),
                          onPressed: (){
                            if(index > 0)
                              setState(() {
                              index--;
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
          )
        ],
      ),
    )
      );
  }

  void updateColor(Color color) {
    setState(() {
      currentColor = color;
    });
  }
}