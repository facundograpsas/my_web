import 'package:flutter/cupertino.dart';

abstract class Project{

  final String title;
  final String description;


  Project({required this.title, required this.description});
}

class DesktopProject extends Project{
  final String title;
  final String description;
  final String? playStore;
  final String? github;

  final List<AssetImage> images;
  DesktopProject(this.title, this.description, this.playStore, this.github, this.images) : super(title: title, description:description);
}

class MobileProject extends Project{
  final String title;
  final String description;
  final String? playStore;
  final String? github;
  final List<AssetImage> images;
  MobileProject(this.title, this.description, this.playStore, this.github, this.images) : super(title: title, description:description);
}

class DesktopAndMobileProject{
  // final String title;
  // final String description;
  // final String? playStore;
  // final String? github;
  // final List<AssetImage> desktopImages;
  // final List<AssetImage> mobileImages;
  final DesktopProject desktopProject;
  final MobileProject mobileProject;
  DesktopAndMobileProject(this.desktopProject, this.mobileProject);

//
  // DesktopAndMobileProject(this.title, this.description, this.playStore, this.github,this.desktopImages, this.mobileImages) : super(title: title, description:description);
}

var projects = [

  DesktopProject("Project1", "Description", null, null, [AssetImage("assets/images/esc1.png"),AssetImage("assets/images/esc2.png"),AssetImage("assets/images/gbg.jpg")]),
  MobileProject("Project2","Description", "https://play.google.com/store/apps/details?id=com.game.android.desencajados" , null, [AssetImage("assets/images/monitor1.png"),AssetImage("assets/images/email_icon2.png"
      ""),AssetImage("assets/images/gbg.jpg")]),
  DesktopProject("Project3", "Description", null, null, [AssetImage("assets/images/gbg.jpg"),AssetImage("assets/images/darkbg.jpg"),AssetImage("assets/images/monitor.png")]),

  DesktopAndMobileProject(
      DesktopProject("Project1", "Description", null, null, [AssetImage("assets/images/esc1.png"),AssetImage("assets/images/esc2.png"),AssetImage("assets/images/gbg.jpg")]),
      MobileProject("Project2","Description", "https://play.google.com/store/apps/details?id=com.game.android.desencajados" , null, [AssetImage("assets/images/monitor1.png"),AssetImage("assets/images/email_icon2.png")]))

];