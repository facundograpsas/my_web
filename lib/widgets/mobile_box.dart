import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_presentation/project.dart';
import 'package:my_presentation/widgets/mobile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileBox extends StatefulWidget {
  final MobileProject project;

  MobileBox({
    required this.project,
    Key? key,
  }) : super(key: key);

  @override
  _MobileBoxState createState() => _MobileBoxState();
}

class _MobileBoxState extends State<MobileBox> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
      height: 850,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(1, 2), blurRadius: 5)
        ],
        color: Colors.black87,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Desencajados",
                style:
                    GoogleFonts.metrophobic(color: Colors.white, fontSize: 40),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text(
                "Proyecto personal",
                style:
                    GoogleFonts.metrophobic(color: Colors.grey, fontSize: 30),
              )),
          MobileWidget(project: widget.project),
          Text(
            "Tecnologías usadas: Kotlin",
            style: TextStyle(color: Colors.grey, fontSize: 16),
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
    ));
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
