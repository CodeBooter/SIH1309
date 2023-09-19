import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/animated_screen.dart';
import 'package:sih1309/client/screens/feature_screen.dart';

import 'package:sih1309/utils/dimensions.dart';

import '../../app_state.dart';
import 'package:go_router/go_router.dart';

import '../../utils/colors.dart';
import '../screens/news_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRefreshing = false;

  Future<void> _refreshData(BuildContext context) async {
    // Perform your refresh logic here
    // For example, you can fetch new data from an API

    // Simulating a delay of 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Set isRefreshing to false to stop the refresh indicator
    setState(() {
      isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightModePrimary,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: AppColors.lightModePrimary,
          elevation: 4,
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'poppins',
              fontSize: Dimension.font20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.go('/notifications');
              },
              icon: const Icon(Icons.notifications),
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
        drawer: AnimatedDrawer(),
        body: Padding(
          padding: EdgeInsets.all(Dimension.width20),
          child: RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimension.val20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Features  🔥",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'poppins',
                          fontSize: Dimension.font24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimension.val10,
                  ),
                  const Features(),
                  SizedBox(
                    height: Dimension.val15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Live news",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'poppins',
                                fontSize: Dimension.font24,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                            TextSpan(
                                text: "   🔴",
                                style: TextStyle(fontSize: Dimension.font20))
                          ])),
                      TextButton(
                        onPressed: () => context.go('/news'),
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: Dimension.font16,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 400, // Set a fixed height for the container
                  //   child: NewsApi(), // Your NewsApi widget
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
