
import 'dart:math';

import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> with SingleTickerProviderStateMixin  {

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    Map data  = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            height: 650,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                  margin: const EdgeInsets.only(top: 70, right: 10, left: 10),
                    padding: EdgeInsets.all(25),
                    height: 650,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          data["name"],
                          style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Milkeyway Galaxy",
                          style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,size: 20,color: Colors.white,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "57.9m km",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                            ),
                           SizedBox(width: 20,),
                            Icon(Icons.arrow_drop_down_circle,size: 20,color: Colors.white,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3.7m/s2",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40,),
                        Text(
                          "OVERVIEW",
                          style: TextStyle(
                            color: Colors.blueGrey.shade50,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: EdgeInsets.all(20),
                          child: Text(
                            data["content"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.blueGrey.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: animationController,
                  child: Image.asset(
                    data["image"],
                    height: 120,
                    width: 120,
                  ),
                  builder: (context, widget) {
                    return Transform.rotate(
                      angle: animationController.value * pi * 2,
                      child: widget,
                    );
                  },
                ),
              ],
            ),
          ),
         Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 40,),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 400,
                              color: Colors.blueGrey.shade700,
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade900,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Welcome to ",
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
                                            ),
                                            Text(
                                              data["name"],
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    data["image"],
                                    height: 95,
                                    width: 95,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Distance to Sun",
                                    style: TextStyle(color: Colors.blueGrey.shade200, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data["distanceToSun"],
                                    style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Distance to Earth",
                                    style: TextStyle(color:Colors.blueGrey.shade200, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data["distanceToEarth"],
                                    style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text(
                      "INFO",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  SizedBox(width: 6,),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25),
                  Spacer(),
                  Icon(Icons.arrow_back_ios, color: Colors.white, size: 25),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "BACK",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
      backgroundColor:Colors.blueGrey.shade900,
    );
  }
}


