import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverIconButton extends StatefulWidget {
  final String imageAsset;
  final String uri;


  HoverIconButton({required this.imageAsset, required this.uri});

  @override
  _HoverIconButtonState createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  var hoverColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(widget.uri);
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            hoverColor = Colors.white;
          });
        } else {
          setState(() {
            hoverColor = Colors.black;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2, color: hoverColor ?? Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image(
            image: AssetImage(widget.imageAsset),
            width: 40,
            height: 40,
            color: Colors.white,

          ),
        ),
      ),
    );
  }
}
