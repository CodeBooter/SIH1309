import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sih1309/utils/dimensions.dart';
import '../../utils/Colors.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightModePrimary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 4,
        title: Text(
          "Learning Screen",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'poppins',
            fontSize: Dimension.font20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimension.val40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/inventoryvideo');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.val10),
                      border: Border.all(
                        color: AppColors.shadowColor,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    width: Dimension.width105,
                    height: Dimension.height128,
                    child: Image.network(
                      'https://i.imgur.com/5MYDzGl.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/woolvedio');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.val10),
                      border: Border.all(
                        color: AppColors.shadowColor,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    width: Dimension.width105,
                    height: Dimension.height128,
                    child: Image.network(
                      'https://i.imgur.com/10FFINf.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/marketvideo');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.val10),
                      border: Border.all(
                        color: AppColors.shadowColor,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    width: Dimension.width105,
                    height: Dimension.height128,
                    child: Image.network(
                      'https://i.imgur.com/I6dEne0.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimension.val20, left: Dimension.val20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Shorts",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimension.font20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimension.val40, left: Dimension.val20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: Dimension.screenHeight / 2 + Dimension.val60,
                width: Dimension.width360, // Adjust as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int index = 0; index < 6; index++)
                      GestureDetector(
                        onTap: () {
                          context.go('/shorts');
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 0 : Dimension.val20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.val10),
                            border: Border.all(
                              color: AppColors.shadowColor,
                              width: 2,
                            ),
                          ),
                          width: Dimension.width220,
                          child: Column(
                            children: [
                              Center(
                                child: Image.network(
                                  'https://i.imgur.com/LYxs4rV.png',
                                  fit: BoxFit.fill, // You can adjust the fit as needed
                                ),
                              ),
                              // Text(
                              //   'Box $index', // Replace with box content
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontFamily: 'poppins',
                              //     fontSize: Dimension.font16, // Adjust as needed
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
