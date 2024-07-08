import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_living_room/widgets/bulb.dart';
import 'package:flutter_living_room/widgets/fan.dart';
import 'package:flutter_living_room/widgets/tv.dart';

class TogglePage extends StatefulWidget {
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  List<bool> toggleSwitch = List.filled(3, false);
  List<int> watts = [30, 10, 50];
  int wattsTotal = 0;

  Timer? fanRotate;
  double angle = 0.0;
  int isToggle = 0;
  bool isPop = false;

  void toggleItem() {
    wattsTotal = 0;
    for (int i = 0; i < toggleSwitch.length; i++) {
      if (toggleSwitch[i]) {
        wattsTotal += watts[i];
      }
    }
  }

  void fastFanFn() {
    fanRotate?.cancel();
    fanRotate = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        angle += 0.7;
      });
    });
  }

  void stopFn() {
    fanRotate?.cancel();
  }

  void slowFanFn() {
    fanRotate?.cancel();
    fanRotate = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      setState(() {
        angle += 0.2;
      });
    });
  }

  void speedfanFn() {
    if (isToggle == 1) {
      return slowFanFn();
    }
    if (isToggle == 2) {
      return fastFanFn();
    }
  }

  void slowerFanFn() {
    fanRotate?.cancel();
    fanRotate = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      setState(() {
        angle += 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF243741)),
                      ),
                      Text(
                        "Living Room",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF243741)),
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isPop = !isPop;
                        });
                      },
                      child: const Icon(
                        Icons.sort,
                        color: Color(0xFF243741),
                      ))
                ],
              ),
            ),
            Flexible(
              child: Center(
                child: Container(
                  // color: Colors.green,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyTv(),
                          MyFan(),
                        ],
                      ),
                      SizedBox(height: 20),
                      MyBulb(),
                      SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isPop)
          Stack(
            children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Color.fromARGB(255, 84, 93, 121).withOpacity(0.5),
                  ),
                ),
              ),
              Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: AnimatedContainer(
                    height: 200,
                    width: 400,
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFBABCC5).withOpacity(0.2),
                          const Color(0xFF9DA1AF).withOpacity(0.1),
                        ],
                      ),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 204, 204, 204).withOpacity(0.4),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPop = !isPop;
                                    });
                                  },
                                  icon: Icon(Icons.close)),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(1, 4),
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "images/SocialMedia/instagram.png",
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "bluee.art14__",
                                        style: TextStyle(
                                          fontSize: 15,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(
                                                  2.0, 2.0), // Offset bayangan
                                              blurRadius:
                                                  3.0, // Radius blur bayangan
                                              color: Colors.black.withOpacity(
                                                  0.1), // Warna bayangan
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  // color: Colors.amber,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                  0.1), // Warna bayangan
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(1, 4),
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          "images/SocialMedia/github.png",
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Blueeyss14",
                                        style: TextStyle(
                                          fontSize: 15,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(
                                                  2.0, 2.0), // Offset bayangan
                                              blurRadius:
                                                  3.0, // Radius blur bayangan
                                              color: Colors.black.withOpacity(
                                                  0.1), // Warna bayangan
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          )
        else
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: AnimatedContainer(
                height: 0,
                width: 0,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6A71A7).withOpacity(0),
                      const Color.fromARGB(255, 63, 65, 71).withOpacity(0.01),
                    ],
                  ),
                  border: Border.all(
                    color: Color(0xFFE4E4E4).withOpacity(0),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ))
      ],
    );
  }
}
