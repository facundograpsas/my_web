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

  MobileProject("Desencajados", "Proyecto personal", "Kotlin" , "https://play.google.com/store/apps/details?id=com.game.android.desencajados", null,
      [AssetImage("assets/images/desencajados1.jpg"),
        AssetImage("assets/images/desencajados2.jpeg"),
        AssetImage("assets/images/desencajados3.jpeg"),
        AssetImage("assets/images/desencajados4.jpg"),
      ]),
  MobileProject("Encontra la palabra!","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=com.games.android.anagrams" , null,
      [AssetImage("assets/images/ELPIGIF1.gif"),AssetImage("assets/images/ELPIGIF2.gif")]),
  MobileProject("Groupiss","Proyecto personal", "Kotlin", null , "https://github.com/facundograpsas/Groupiss",
      [AssetImage("assets/images/groupis2.jpeg"),AssetImage("assets/images/groupis1.jpeg"), AssetImage("assets/images/groupis3.jpeg"),  AssetImage("assets/images/groupis4.jpeg")]),
  MobileProject("Memeverso","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=com.app.android.memeverso" , null,
      [AssetImage("assets/images/memeversoGif1.gif"),
        AssetImage("assets/images/memeversoGif2.gif"),
        AssetImage("assets/images/memeversoGif3.gif")]),
  MobileProject("Fill the screen!","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=perpetuum.fillthescreen.android.game" , null,
      [AssetImage("assets/images/fillthescreen1.gif"),AssetImage("assets/images/fillthescreen2.gif")]),
  MobileProject("Daily Taskjs","Proyecto personal", "Dart (Flutter)", null , "https://github.com/facundograpsas/daily-tasks",
      [AssetImage("assets/images/dailytasks1.gif"),
        AssetImage("assets/images/dailytasks2.gif"),
        AssetImage("assets/images/dailytasks3.gif")]),
  DesktopProject("Wagashi Manager", "Freelance", "HTML5, CSS3, NodeJS, Postgres", null, null,
      [AssetImage("assets/images/wagashi1.png"),
        AssetImage("assets/images/wagashi2.png"),
        AssetImage("assets/images/wagashi3.png"),
        AssetImage("assets/images/wagashi4.png")

      ]),

  DesktopAndMobileProject(
      DesktopProject("Chatbot", "Proyecto personal", "Flutter, Python", null, null, [AssetImage("assets/images/esc1.png"),AssetImage("assets/images/esc2.png"),AssetImage("assets/images/gbg.jpg")]),
      MobileProject("Chatbot", "Proyecto personal", "Flutter, Python", null, null, [AssetImage("assets/images/esc1.png"),AssetImage("assets/images/esc2.png"),AssetImage("assets/images/gbg.jpg")]),
  )
];