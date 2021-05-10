import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_presentation/widgets/hover_icon_button.dart';
import 'package:my_presentation/widgets/rainbow_container.dart';

class NameCard extends StatefulWidget {
  const NameCard({
    Key? key,
    required this.widthFactor,
  }) : super(key: key);

  final double widthFactor;

  @override
  _NameCardState createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  var borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // alignment: Alignment.center,
    width: widget.widthFactor,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white60),
          color: Colors.black38.withOpacity(1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(2, 5),
              blurRadius: 10,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: RainbowContainer(height:2.toDouble(), filled: true, key:Key("asd"),)),
              Expanded(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('Facundo '
                        'Grapsas',
                    style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(
                            color: Colors.white)),
                  ),
                ),
              ),
              Expanded(child: RainbowContainer(height:2.toDouble(), filled: true, key: Key("asd"),)),
            ],
          ),
          Text(
            'Full Stack developer',
            style: GoogleFonts.metrophobic(
                textStyle: TextStyle(color: Colors.grey, fontSize: 20)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverIconButton(
                  imageAsset: "assets/images/github.png",
                  uri: "https://github.com/facundograpsas",
                ),
                HoverIconButton(
                  imageAsset: "assets/images/email.png",
                  uri: "mailto:facundo.grapsas@gmail.com",
                ),
                HoverIconButton(
                  imageAsset: "assets/images/linkedin.png",
                  uri: "https://www.linkedin.com/in/facundo-grapsas-7a4936187/"
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}