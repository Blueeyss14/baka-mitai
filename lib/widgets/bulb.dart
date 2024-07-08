import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBulb extends StatefulWidget {
  const MyBulb({super.key});

  @override
  State<MyBulb> createState() => _MyBulbState();
}

class _MyBulbState extends State<MyBulb> {
  List<bool> toggleSwitch = List.filled(3, false);
  List<int> watts = [0, 10];
  int wattsTotal = 0;

  Timer? fanRotate;
  double angle = 0.0;
  int isToggle = 0;
  bool isClicked = false;

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
                        trackColor: Color.fromARGB(255, 88, 100, 122),
                        activeColor: Color.fromARGB(255, 94, 110, 146),
                        value: toggleSwitch[1],
                        onChanged: (bool value) {
                          setState(() {
                            toggleSwitch[1] = value;
                            if (toggleSwitch[1]) {
                              return slowerFanFn();
                            } else {
                              stopFn();
                            }
                          });
                        },
                      ),
                    ),
                    const Icon(
                      Icons.zoom_in,
                      size: 25,
                      color: Color(0xFF3B5B6B),
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
                        if (!toggleSwitch[1])
                          Image.asset("images/Bulb/flutter-living-Bulb.png")
                        else
                          Image.asset(
                              "images/Bulb/flutter-living-Bulb-Light.png")
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
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isToggle++;

                                        if (isToggle > 1) {
                                          isToggle = 0 + 1;
                                        }
                                        if (toggleSwitch[1]) {
                                          speedfanFn();
                                        }
                                      });
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text("1"),
                                    ),
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
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isToggle = 2;
                                        if (toggleSwitch[1]) {
                                          speedfanFn();
                                        }
                                      });
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text("2"),
                                    ),
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
                          if (toggleSwitch[1])
                            Text(
                              "Watt: ${watts[1]}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF243741),
                              ),
                            )
                          else
                            const Text(
                              "Watt: 0",
                              style: const TextStyle(
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
