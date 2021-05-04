import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_presentation/project.dart';
import 'package:my_presentation/widgets/desktop_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class DesktopBox extends StatefulWidget {
  final DesktopProject project;
  Widget? app;

  DesktopBox({required this.project,
    Key? key, this.app
  }) : super(key: key);


  @override
  _DesktopBoxState createState() => _DesktopBoxState();
}

class _DesktopBoxState extends State<DesktopBox> {
  @override
  Widget build(BuildContext context) {
    return
      FittedBox(
      child:Container(
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
          color: Colors.black87,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top:30),
              child: Text(widget.project.title,
              style: GoogleFonts.metrophobic(color: Colors.white,
              fontSize: 30),)),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(widget.project.description,
            style: GoogleFonts.metrophobic(
                color: Colors.grey,
            fontSize: 18),)
          ),
            DesktopWidget(project: widget.project, app: widget.project.widget,),
          Text(
            "Hecho en: ${widget.project.madeWith}",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                    style: GoogleFonts.metrophobic(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    children: playStoreLink()
                ),
              )),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                    style: GoogleFonts.metrophobic(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    children: githubLink()
                ),
              ))
        ],
      ),
    )
      );
  }

  playStoreLink(){
    List<TextSpan> link = [];
    if(widget.project.playStore!= null){
      link.add(TextSpan(
          text: "Play Store: ",
          style: TextStyle(color: Colors.white)));
      link.add(TextSpan(
          text:
          widget.project.playStore,
          style:TextStyle(color: Colors.blue),
          recognizer: new TapGestureRecognizer()
            ..onTap = () { launch(widget.project.playStore.toString());}
      ));
    }
    return link;
  }

  githubLink(){
    List<TextSpan> link = [];
    if(widget.project.github!= null){
      link.add(TextSpan(
          text: "Github: ",
          style: TextStyle(color: Colors.white)));
      link.add(TextSpan(
          text:
          widget.project.github,
          style:TextStyle(color: Colors.blue),
          recognizer: new TapGestureRecognizer()
            ..onTap = () { launch(widget.project.github.toString());}
      ));
    }
    return link;
  }
}