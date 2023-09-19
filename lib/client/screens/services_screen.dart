import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_state.dart';
import '../../utils/Colors.dart';
import '../../utils/Dimensions.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
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
        title: Text(
          "Services",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'poppins',
            fontSize: Dimension.font20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Replace this with your service items
          ServiceItem(
            companyName: "Hanara shearing",
            companyLogoUrl:
                "https://i.imgur.com/8NddYRe.png", // Replace with your image asset path
            title: "Shearing Service",
            description: "Best shearing services for your sheep",
            rating: 4.0,
          ),
          ServiceItem(
            companyName: "Wool processing ltd",
            companyLogoUrl:
                "https://i.imgur.com/CxniHDk.png", // Replace with your image asset path
            title: "Processing Service",
            description: "Best Processing services for your wool",
            rating: 4.0,
          ),
          // Add more service items as needed
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String companyName;
  final String companyLogoUrl;
  final String title;
  final String description;
  final double rating;

  ServiceItem({
    required this.companyName,
    required this.companyLogoUrl,
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Adjust the border radius as needed
        side: BorderSide(
          color: Colors.grey, // Adjust the border color
          width: 1.0, // Adjust the border width
        ),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  companyLogoUrl,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 8.0),
                Column(
                  children: [
                    Text(
                      companyName,
                      style: TextStyle(
                          fontSize: Dimension.font20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: Dimension.font18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.message_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () {
                        // Handle message button click
                      },
                      child: Text(
                        'Message',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () {
                        _makePhoneCall(context);
                        // Handle call button click
                      },
                      child: Text(
                        'Call',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '$rating',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 4.0),
                    Icon(
                      Icons.star,
                      size: Dimension.val20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(BuildContext context) async {
    final phoneNum = "917999432794"; // Replace with the actual phone number
    final url = Uri.parse('tel:+$phoneNum');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle error, e.g., show an alert dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Could not launch the pjjhhone app."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
