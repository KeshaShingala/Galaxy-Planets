
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../detail_screen/detailpage.dart';


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>  with TickerProviderStateMixin {

  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;
  late AnimationController animationController5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    animationController3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    animationController4 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    animationController5 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    animationController4.dispose();
    animationController5.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GALAXY   PLANETS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("secondpage");
            },
            icon: Icon(Icons.more_vert_outlined),
          ),
        ],
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      height: 2000,
                      width: 280,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: data.map(
                                (e) =>
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      setState((){
                                        Navigator.of(context).pushNamed("secondpage",arguments: e);
                                      }
                                      );
                                    },
                                    child: SizedBox(
                                      height: 180,
                                      width: double.infinity,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            right: 0,
                                            child: Container(
                                              height: 170,
                                              width: 280,
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey.shade700,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      "${e['name']}",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      "Milkeyway Galaxy",
                                                      style: TextStyle(
                                                        color: Colors.blueGrey.shade300,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.location_on,size: 20,color: Colors.white,),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "49.3m km",
                                                          style: TextStyle(
                                                            color: Colors.grey.shade400,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Icon(Icons.arrow_drop_down_circle,size: 20,color: Colors.white,),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "2.9m/s2",
                                                          style: TextStyle(
                                                            color: Colors.grey.shade400,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            child: AnimatedBuilder(
                                              animation: animationController1,
                                              child: Image.asset("${e['image']}",
                                                height: 100,
                                                width: 100,
                                              ),
                                              builder: (context, widget) {
                                                return Transform.rotate(
                                                  angle: animationController1.value * pi * 2,
                                                  child: widget,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor:Colors.blueGrey.shade900,
    );
  }
}
