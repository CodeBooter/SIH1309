import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/news_api.dart';
import 'package:sih1309/utils/dimensions.dart';

import '../../../app_state.dart';
import '../../../utils/colors.dart';

class Sheep extends StatefulWidget {
  const Sheep({super.key});

  @override
  State<Sheep> createState() => _SheepState();
}

class _SheepState extends State<Sheep> {
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
        backgroundColor: AppColors.lightModePrimary,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: AppColors.lightModePrimary,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          toolbarHeight: Dimension.val70,
          centerTitle: true,
          title: Text("Sheep",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'poppins',
                fontSize: Dimension.font20,
                fontWeight: FontWeight.w500,
              )),
        ),
        body: Center(
          child: Text("This is wool quality"),
        ));
  }
}
