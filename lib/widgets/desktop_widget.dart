import 'package:flutter/material.dart';
import 'package:my_presentation/project.dart';


class DesktopWidget extends StatefulWidget {


  final DesktopProject project;

  DesktopWidget({required this.project});

  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {

  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FittedBox(
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
    );
  }
}
