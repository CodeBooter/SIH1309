import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final double imageHeight = Dimension.val70;
  final double imageWidth = Dimension.width60;
  final double containerWidth = Dimension.width110;
  final double containerHeight = Dimension.height110;
  final double borderRadius = Dimension.val10;
  final double spacing = Dimension.val25;
  final double runSpacing = Dimension.val25;
  final Duration tapDelay = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimension.val10),
        Wrap(
          // spacing: spacing,
          runSpacing: runSpacing,
          children: [
            _buildFeatureContainer(
              titleText: "Inventory",
              imageAsset: appState.isDarkMode
                  ? 'https://i.imgur.com/5MYDzGl.png'
                  : 'https://i.imgur.com/5MYDzGl.png',
              onTap: () => _navigateTo('/dsa'),
            ),
            SizedBox(
              width: Dimension.width25,
            ),
            _buildFeatureContainer(
              titleText: "Wool Quality",
              imageAsset: 'https://i.imgur.com/10FFINf.png',
              onTap: () => _navigateTo('/dsa'),
            ),
            SizedBox(width: Dimension.width25),
            _buildFeatureContainer(
              titleText: "Marketplace",
              imageAsset: 'https://i.imgur.com/I6dEne0.png',
              onTap: () => _navigateTo('/dsa'),
            ),
            _buildFeatureContainer(
              titleText: "Services",
              imageAsset: 'https://i.imgur.com/lX63GiV.png',
              onTap: () => _navigateTo('/courses'),
            ),
            SizedBox(width: Dimension.width25),
            _buildFeatureContainer(
              titleText: "Learning",
              imageAsset: 'https://i.imgur.com/kNGQdKO.png',
              onTap: () => _navigateTo('/interview'),
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
    );
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
                borderRadius: BorderRadius.circular(borderRadius),
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
                  borderRadius: BorderRadius.circular(borderRadius),
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
                          borderRadius: BorderRadius.circular(borderRadius),
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
