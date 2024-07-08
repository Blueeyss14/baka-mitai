import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_living_room/home/living_room.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late WidgetCubit bodyCont;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 212, 241, 255),
            Color.fromARGB(255, 61, 60, 119)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: TogglePage(),
      ),
    );
  }
}
