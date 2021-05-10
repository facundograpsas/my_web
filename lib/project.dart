import 'package:flutter/cupertino.dart';
import 'package:my_presentation/my_app.dart';

abstract class Project{

  final String title;
  final String description;


  Project({required this.title, required this.description});
}

class DesktopProject extends Project{

  final String? linkTitle;
  final String title;
  final String description;
  final String madeWith;
  final String? playStore;
  final String? github;
  final List<AssetImage> images;
  Widget? app;
  DesktopProject(this.title, this.description, this.madeWith, this.linkTitle, this.playStore, this.github, this.images, this.app) : super(title: title, description:description);
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

  DesktopProject("Wagashi Manager", "Trabajo Freelance", "HTML5, CSS3, NodeJS, Postgres", null, null,
      null,
      [AssetImage("assets/images/projects/wagashi1.png"),
        AssetImage("assets/images/projects/wagashi2.png"),
        AssetImage("assets/images/projects/wagashi3.png"),
        AssetImage("assets/images/projects/wagashi4.png")
      ], null),

  MobileProject("Encontra la palabra!","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=com.games.android.anagrams" , null,
      [AssetImage("assets/images/projects/ELPIGIF1.gif"),AssetImage("assets/images/projects/ELPIGIF2.gif")]),

  MobileProject("Desencajados", "Proyecto personal", "Kotlin" , "https://play.google.com/store/apps/details?id=com.game.android.desencajados", null,
      [AssetImage("assets/images/projects/desencajados1.jpg"),
        AssetImage("assets/images/projects/desencajados2.jpeg"),
        AssetImage("assets/images/projects/desencajados3.jpeg"),
        AssetImage("assets/images/projects/desencajados4.jpg"),
      ]),

  MobileProject("Memeverso","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=com.app.android.memeverso" , null,
      [AssetImage("assets/images/projects/memeversoGif1.gif"),
        AssetImage("assets/images/projects/memeversoGif2.gif"),
        AssetImage("assets/images/projects/memeversoGif3.gif")]),


  MobileProject("pepeito","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=com.app.android.memeverso" , null,
      [AssetImage("assets/images/projects/memeversoGif1.gif"),
        AssetImage("assets/images/projects/memeversoGif2.gif"),
        AssetImage("assets/images/projects/memeversoGif3.gif")]),


  DesktopProject("Esta página", "Proyecto personal", "Dart (Flutter)", null, null, null,
      [AssetImage("assets/images/projects/wagashi1.png")], MyApp()),


  MobileProject("Groupiss","Proyecto personal", "Kotlin", null , "https://github.com/facundograpsas/Groupiss",
      [AssetImage("assets/images/projects/groupis2.jpeg"),
        AssetImage("assets/images/projects/groupis1.jpeg"),
        AssetImage("assets/images/projects/groupis3.jpeg"),
        AssetImage("assets/images/projects/groupis4.jpeg")]),

  MobileProject("Daily Taskjs","Proyecto personal", "Dart (Flutter)", null , "https://github.com/facundograpsas/daily-tasks",
      [
        AssetImage("assets/images/projects/dailytasks1.gif"),
        AssetImage("assets/images/projects/dailytasks2.gif"),
        AssetImage("assets/images/projects/dailytasks3.gif")]),

  MobileProject("Fill the screen!","Proyecto personal", "Kotlin", "https://play.google.com/store/apps/details?id=perpetuum.fillthescreen.android.game" , null,
      [AssetImage("assets/images/projects/fillthescreen1.gif"),AssetImage("assets/images/projects/fillthescreen2.gif")]),



  DesktopAndMobileProject(
    DesktopProject("Emulador de chat","Proyecto personal", "Dart (Flutter)", "Web: ", "https://groupchat-emulator.web.app/" , "https://github.com/facundograpsas/chat_emulator",
        [AssetImage("assets/images/projects/chat_desktop.gif")], null),
    MobileProject("Emulador de chat","Proyecto personal", "Dart (Flutter)", null , null,
        [AssetImage("assets/images/projects/chat_mobile.gif")]),
  ),
];