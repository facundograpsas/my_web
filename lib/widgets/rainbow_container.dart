import 'package:flutter/material.dart';
import 'package:rainbow_color/rainbow_color.dart';

class RainbowContainer extends StatefulWidget {
  final shape;
  final double? height;
  final double? borderWidth;
  final double? width;
  final filled;
  final Widget? child;
  final alignment;
  final margin;


   RainbowContainer({
    this.margin,
    this.alignment,
    this.child,
    this.filled : false,
    this.width,
    this.borderWidth,
    this.height,
    this.shape,
    Key? key,
  }) : super(key: key);

  @override
  _RainbowContainerState createState() => _RainbowContainerState();
}

class _RainbowContainerState extends State<RainbowContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color> _colorAnim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    _colorAnim = RainbowColorTween([
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.yellow,
      Colors.white,
      Colors.blue
    ]).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Color? color;
    Border? border;
    if(widget.filled){
      color = _colorAnim.value;
    }
    if(widget.borderWidth!=null){
      border = Border.all(color: _colorAnim.value, width: widget.borderWidth!);
    }
    return Container(
      margin: widget.margin,
      alignment: widget.alignment,
      height: widget.height,
      width: widget.width,
      child: widget.child,
      decoration: BoxDecoration(
          color: color,
          shape: widget.shape ?? BoxShape.rectangle,
          border: border,
      ),
    );
  }
}
