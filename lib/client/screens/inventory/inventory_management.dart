import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/news_api.dart';
import 'package:sih1309/utils/Dimensions.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../app_state.dart';
import '../../../utils/Colors.dart';

class InventoryMgmnt extends StatelessWidget {
  const InventoryMgmnt({super.key});

  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Filled": 70,
      "Empty": 30,
    };
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
          title: Text("Inventory Management",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'poppins',
                fontSize: Dimension.font20,
                fontWeight: FontWeight.w500,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimension.width20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      height: Dimension.height200,
                      width: Dimension.width180,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 227, 227)),
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 10,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,

                        initialAngleInDegree: 0,
                        chartType: ChartType.disc,

                        legendOptions: LegendOptions(
                          showLegendsInRow: true,
                          legendPosition: LegendPosition.bottom,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 0,
                        ),
                        // gradientList: ---To add gradient colors---
                        // emptyColorGradient: ---Empty Color gradient---
                      )),
                  Column(
                    children: [
                      Container(
                        height: Dimension.height100,
                        width: Dimension.width181,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      Container(
                        height: Dimension.height100,
                        width: Dimension.width181,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 158, 183)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
