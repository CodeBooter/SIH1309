import 'package:flutter/material.dart';
import 'package:sih1309/utils/dimensions.dart';

import '../../utils/Colors.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding:  EdgeInsets.only(top: Dimension.val20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
