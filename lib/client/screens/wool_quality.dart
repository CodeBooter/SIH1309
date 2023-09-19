import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/news_api.dart';
import 'package:sih1309/utils/Dimensions.dart';

import '../../app_state.dart';
import '../../utils/Colors.dart';

class WoolQuality extends StatefulWidget {
  const WoolQuality({super.key});

  @override
  State<WoolQuality> createState() => _WoolQualityState();
}

class _WoolQualityState extends State<WoolQuality> {
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
          title: Text("Wool Quality",
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
