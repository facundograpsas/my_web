import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_presentation/project.dart';
import 'package:my_presentation/widgets/desktop_widget.dart';
import 'package:my_presentation/widgets/mobile_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class DesktopAndMobileBox extends StatefulWidget {
  final DesktopAndMobileProject project;

  DesktopAndMobileBox({required this.project,
    Key? key,
  }) : super(key: key);

  @override
  _DesktopAndMobileBoxState createState() => _DesktopAndMobileBoxState();
}

class _DesktopAndMobileBoxState extends State<DesktopAndMobileBox> {
  @override
  Widget build(BuildContext context) {


    return
      FittedBox(
      child:Container(
      height: 950,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 2),
                blurRadius: 5
            )
          ],
          color: Colors.black87,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top:50),
              child: Text(widget.project.mobileProject.title,
              style: GoogleFonts.metrophobic(color: Colors.white,
              fontSize: 50),)),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Text(widget.project.mobileProject.description,
            style: GoogleFonts.metrophobic(
                color: Colors.grey,
            fontSize: 30),)
          ),
          Row(
            children: [
              DesktopWidget(project: widget.project.desktopProject),
              MobileWidget(project: widget.project.mobileProject),
            ],
          ),
          Text(
            "Hecho en: ${widget.project.desktopProject.madeWith}",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                    style: GoogleFonts.metrophobic(
                        color: Colors.grey,
                        fontSize: 20,
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
                        fontSize: 20,
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
    if(widget.project.desktopProject.playStore!= null){
      link.add(TextSpan(
          text: widget.project.desktopProject.linkTitle,
          style: TextStyle(color: Colors.white)));
      link.add(TextSpan(
          text:
          widget.project.desktopProject.playStore,
          style:TextStyle(color: Colors.blue),
          recognizer: new TapGestureRecognizer()
            ..onTap = () { launch(widget.project.desktopProject.playStore.toString());}
      ));
    }
    return link;
  }

  githubLink(){
    List<TextSpan> link = [];
    if(widget.project.desktopProject.github!= null){
      link.add(TextSpan(
          text: "Github: ",
          style: TextStyle(color: Colors.white)));
      link.add(TextSpan(
          text:
          widget.project.desktopProject.github,
          style:TextStyle(color: Colors.blue),
          recognizer: new TapGestureRecognizer()
            ..onTap = () { launch(widget.project.desktopProject.github.toString());}
      ));
    }
    return link;
  }

}