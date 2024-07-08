import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTv extends StatefulWidget {
  const MyTv({super.key});

  @override
  State<MyTv> createState() => _MyTvState();
}

class _MyTvState extends State<MyTv> {
  List<bool> toggleSwitch = List.filled(3, false);
  List<int> watts = [50, 10, 50];
  int wattsTotal = 0;

  Timer? fanRotate;
  double angle = 0.0;
  int isToggle = 0;

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

  void slowFanFn() {
    fanRotate?.cancel();
    fanRotate = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      setState(() {
        angle += 0.2;
      });
    });
  }

  void slowerFanFn() {
    fanRotate?.cancel();
    fanRotate = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      setState(() {
        angle += 0.1;
      });
    });
  }

  void stopFn() {
    fanRotate?.cancel();
  }

  void speedfanFn() {
    if (isToggle == 1) {
      return slowFanFn();
    }
    if (isToggle == 2) {
      return fastFanFn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6A71A7).withOpacity(0.2),
                const Color.fromARGB(255, 63, 65, 71).withOpacity(0.01),
              ],
            ),
            border: Border.all(
              color: Color(0xFFE6E6E6).withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 220,
          height: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        thumbColor: Colors.grey[250],
                        trackColor: Color.fromARGB(255, 113, 128, 156),
                        activeColor: Color.fromARGB(255, 94, 110, 146),
                        value: toggleSwitch[0],
                        onChanged: (bool value) {
                          setState(() {
                            toggleSwitch[0] = value;
                            if (toggleSwitch[0]) {
                              return slowerFanFn();
                            } else {
                              stopFn();
                            }
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.zoom_in,
                        size: 25,
                        color: Color(0xFF3B5B6B),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Center(
                  child: Container(
                    // color: Colors.green,
                    child: Stack(
                      children: [
                        if (!toggleSwitch[0])
                          Transform.scale(
                            scale: 1.3,
                            child: Image.asset(
                              "images/TV/flutter-living-TV.png",
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        else
                          Transform.scale(
                            scale: 1.3,
                            child: Image.asset(
                              "images/TV/ucok baka.gif",
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        if (toggleSwitch[0])
                          Transform.scale(
                            scale: 1.3,
                            child: Image.asset(
                              "images/TV/flutter-living-TV-true.png",
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // color: Colors.blue[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFF6A71A7).withOpacity(0.2),
                                      const Color.fromARGB(255, 63, 65, 71)
                                          .withOpacity(0.01),
                                    ],
                                  ),
                                  border: Border.all(
                                    color: Color(0xFFE4E4E4).withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Text("1"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFF6A71A7).withOpacity(0.2),
                                      const Color.fromARGB(255, 63, 65, 71)
                                          .withOpacity(0.01),
                                    ],
                                  ),
                                  border: Border.all(
                                    color: Color(0xFFE4E4E4).withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Text("2"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          if (toggleSwitch[0])
                            Text(
                              "Watt: ${watts[0]}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF243741),
                              ),
                            )
                          else
                            const Text(
                              "Watt: 0",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF243741),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
