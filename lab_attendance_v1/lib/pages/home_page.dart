import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_attendance_v1/pages/qr_scanner.dart';

import '../components/my_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  List<String> listOfStrings = [
    'Home',
    'Scan QR',
    'Access',
    'Profile',
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.qr_code_2_rounded,
    Icons.accessibility_new_rounded,
    Icons.verified_user_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Lab Attendance",
            style: TextStyle(color: Colors.black, fontSize: 22)),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            )
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      HapticFeedback.lightImpact();
                    });
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QRViewExample()),
                      );
                    }
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex
                            ? displayWidth * .32
                            : displayWidth * 0.18,
                        // Adjusted width value
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height:
                              index == currentIndex ? displayWidth * .12 : 0,
                          width: index == currentIndex ? displayWidth * .32 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? Colors.blueAccent.withOpacity(.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex
                            ? displayWidth * .31
                            : displayWidth * 0.18,
                        // Adjusted width value
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex
                                      ? displayWidth * .13
                                      : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == currentIndex ? 1 : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == currentIndex
                                        ? '${listOfStrings[index]}'
                                        : '',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex
                                      ? displayWidth * .03
                                      : 20,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  size: displayWidth * .076,
                                  color: index == currentIndex
                                      ? Colors.blueAccent
                                      : Colors.black26,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
