import 'package:flutter/cupertino.dart';

abstract class Project{

  final String title;
  final String description;


  Project({required this.title, required this.description});
}

class DesktopProject extends Project{
  final String title;
  final String description;
  final String madeWith;
  final String? playStore;
  final String? github;

  final List<AssetImage> images;
  DesktopProject(this.title, this.description, this.madeWith, this.playStore, this.github, this.images) : super(title: title, description:description);
}

class MobileProject extends Project{
  final String title;
  final String description;
  final String? playStore;
  final String? github;
  final String madeWith;
  final List<AssetImage> images;
  MobileProject(this.title, this.description, this.madeWith, this.playStore, this.github, this.images) : super(title: title, description:description);
}

class DesktopAndMobileProject{
  final DesktopProject desktopProject;
  final MobileProject mobileProject;
  DesktopAndMobileProject(this.desktopProject, this.mobileProject);
}

var projects = [

  MobileProject("Desencajados", "Proyecto personal", "Kotlin" , "https://play.google.com/store/apps/details?id=com.game.android.desencajados", "www.ghitbusn.com/ijhaksa/jdesencajdos", [AssetImage("assets/images/des2.jpeg"),AssetImage("assets/images/des3.jpeg"),AssetImage("assets/images/des4.jpeg")]),
  MobileProject("Encontra la palabra","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=com.game.android.desencajados" , null, [AssetImage("assets/images/monitor1.png"),AssetImage("assets/images/email_icon2.png"
      ""),AssetImage("assets/images/gbg.jpg")]),
  DesktopProject("Daily tasks", "Proyecto personal", "Flutter, SQLite", null, null, [AssetImage("assets/images/gbg.jpg"),AssetImage("assets/images/darkbg.jpg"),AssetImage("assets/images/monitor.png")]),

  DesktopAndMobileProject(
      DesktopProject("Chatbot", "Proyecto personal", "Flutter, Python", null, null, [AssetImage("assets/images/esc1.png"),AssetImage("assets/images/esc2.png"),AssetImage("assets/images/gbg.jpg")]),
      MobileProject("Chatbot", "Proyecto personal", "Flutter, Python", null, null, [AssetImage("assets/images/esc1.png"),AssetImage("assets/images/esc2.png"),AssetImage("assets/images/gbg.jpg")]),
  )
];