import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/news_api.dart';

import 'package:sih1309/utils/dimensions.dart';


import '../../../utils/dimensions.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../app_state.dart';
import '../../../utils/colors.dart';

class InventoryMgmnt extends StatefulWidget {
  InventoryMgmnt({super.key});

  @override
  State<InventoryMgmnt> createState() => _InventoryMgmntState();
}

class _InventoryMgmntState extends State<InventoryMgmnt> {
  final double imageHeight = Dimension.val70;
  final double imageWidth = Dimension.width60;
  final double containerWidth = Dimension.width110;
  final double containerHeight = Dimension.height110;
  final double borderRadius = Dimension.val10;
  final double spacing = Dimension.val25;
  final double runSpacing = Dimension.val25;
  final Duration tapDelay = const Duration(milliseconds: 200);
  Widget build(BuildContext context) {

    Map<String, double> dataMap = {
      "Filled": 80,
      "Empty": 20,
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

        body: Center(
          child: Text("This is inventro"),

        body: Padding(
          padding: EdgeInsets.all(Dimension.width20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      height: Dimension.height200,
                      width: Dimension.width190,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 227, 227)),
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 10,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,

                        initialAngleInDegree: 0,
                        chartType: ChartType.disc,

                        legendOptions: const LegendOptions(
                          showLegendsInRow: true,
                          legendPosition: LegendPosition.bottom,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        chartValuesOptions: const ChartValuesOptions(
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "14",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                "Shipment in progress",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 139, 138, 138),
                                  fontSize: Dimension.font16,
                                ),
                              )
                            ]),
                        height: Dimension.height100,
                        width: Dimension.width180,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 246, 220)),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Dimension.val60,
                              width: Dimension.width100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.imgur.com/ylwEtsE.png"),
                                ),
                              ),
                            ),
                            Text(
                              "Track shipment",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        height: Dimension.height100,
                        width: Dimension.width180,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 206, 218, 245)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.val20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimension.val10),
                  Wrap(
                    // spacing: spacing,
                    runSpacing: runSpacing,
                    children: [
                      _buildFeatureContainer(
                        titleText: "Add Product",
                        imageAsset: 'https://i.imgur.com/IHfXYTd.png',
                        onTap: () => _navigateTo('/inventory'),
                      ),
                      SizedBox(
                        width: Dimension.width25,
                      ),
                      _buildFeatureContainer(
                        titleText: "Send Delievery",
                        imageAsset: 'https://i.imgur.com/yqbhSV3.png',
                        onTap: () => _navigateTo('/woolquality'),
                      ),
                      SizedBox(width: Dimension.width25),
                      _buildFeatureContainer(
                        titleText: "Stock",
                        imageAsset: 'https://i.imgur.com/FfNhEBj.png',
                        onTap: () => _navigateTo('/marketplace'),
                      ),
                      _buildFeatureContainer(
                        titleText: "Invoices",
                        imageAsset: 'https://i.imgur.com/Kahx2Vo.png',
                        onTap: () => _navigateTo('/courses'),
                      ),
                      SizedBox(width: Dimension.width25),
                      _buildFeatureContainer(
                        titleText: "History",
                        imageAsset: 'https://i.imgur.com/pUa8AYb.png',
                        onTap: () => _navigateTo('/learning'),
                      ),
                      SizedBox(width: Dimension.width25),
                      _buildFeatureContainer(
                        titleText: "Thinking",
                        imageAsset: appState.isDarkMode
                            ? 'https://i.imgur.com/5MYDzGl.png'
                            : 'https://i.imgur.com/5MYDzGl.png',
                        onTap: () => _navigateTo('/notes'),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),

        ));
  }

  Widget _buildFeatureContainer({
    required String titleText,
    required String imageAsset,
    required VoidCallback onTap,
  }) {
    final appState = Provider.of<AppState>(context);
    return InkWell(
        onTap: () {
          Future.delayed(tapDelay, onTap);
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: AppColors.shadowColor,
                  width: 2,
                ),
              ),
              alignment: Alignment.centerLeft,
              width: containerWidth,
              height: containerHeight,
              child: Ink(
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 220, 74, 74),
                  // borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: imageAsset,
                    imageBuilder: (context, imageProvider) => Container(
                      height: imageHeight,
                      width: imageWidth,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                          // borderRadius: BorderRadius.circular(borderRadius),
                          color: Colors.transparent),
                    ),
                    // placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimension.val10),
            Text(titleText,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'poppins',
                  fontSize: Dimension.font18,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ));
  }

  void _navigateTo(String route) {
    context.go(route);
  }
}
