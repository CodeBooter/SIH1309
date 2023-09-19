import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/app_state.dart';
import 'package:sih1309/utils/Colors.dart';
import 'package:sih1309/utils/Dimensions.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class WoolQuality extends StatefulWidget {
  const WoolQuality({super.key});

  @override
  State<WoolQuality> createState() => _WoolQualityState();
}

class _WoolQualityState extends State<WoolQuality> {
  File? _imageFile; // To store the picked image
  final _formKey = GlobalKey<FormState>();
  String? greaseFleeceWeight;
  String? cleanFleeceWeight;
  String? stapleLength;
  String? avgFiberDiameter;
  String? faceWoolCover;
  String? skinWrinkles;
  String? bellyWool;

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
          "Wool Quality",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'poppins',
            fontSize: Dimension.font20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(Dimension.width20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    //open camera and click photo to display in
                    _getImageFromCamera();
                  },
                  child: Container(
                    height: Dimension.height160,
                    width: Dimension.width165,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 234, 234),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimension.val20,
                        ),
                        Image.network(
                          "https://i.imgur.com/u8LxPF2.png",
                          height: Dimension.height80,
                          width: Dimension.width60,
                        ),
                        SizedBox(
                          height: Dimension.val10,
                        ),
                        SizedBox(
                          height: Dimension.val10,
                        ),
                        Text(
                          "Click wool photo",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins',
                            fontSize: Dimension.font16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimension.width40,
                ),
                GestureDetector(
                  onTap: () {
                    // Perform your action here when the container is tapped
                    // For example, you can navigate to another screen or execute a function.
                    // You can replace the print statement with your desired action.
                    // camera
                    _getImageFromGallery();
                  },
                  child: Container(
                    height: Dimension.height160,
                    width: Dimension.width165,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 234, 222),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimension.val20,
                        ),
                        Image.network(
                          "https://i.imgur.com/b8Zacho.png",
                          height: Dimension.height80,
                          width: Dimension.width60,
                        ),
                        SizedBox(
                          height: Dimension.val10,
                        ),
                        Text(
                          "Upload wool photo",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins',
                            fontSize: Dimension.font16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimension.val10,
            ),
            // Display the picked image if available
            Container(
              height: Dimension.height80,
              width: Dimension.screenWidth,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 244, 244, 204),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimension.width10,
                    ),
                    if (_imageFile == null)
                      Text(
                        "Please Select image",
                        style: TextStyle(color: Colors.black),
                      ),
                    if (_imageFile != null)
                      Text(
                        "Image Selected",
                        style: TextStyle(color: Colors.black),
                      ),
                    if (_imageFile != null)
                      Image.file(
                        _imageFile!,
                        height: Dimension.val60,
                        width: Dimension.width60,
                      ),
                    SizedBox(
                      width: Dimension.width10,
                    ),
                  ]),
            ),
            Text("Enter Wool Details",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'poppins',
                  fontSize: Dimension.font20,
                  fontWeight: FontWeight.w500,
                )),
            //form field below
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Grease Fleece Weight
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Grease Fleece Weight',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Grease Fleece Weight';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          greaseFleeceWeight = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Clean Fleece Weight
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Clean Fleece Weight',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Clean Fleece Weight';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          cleanFleeceWeight = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Staple Length
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Staple Length',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onSaved: (value) {
                        setState(() {
                          stapleLength = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Average Fiber Diameter
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Average Fiber Diameter',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onSaved: (value) {
                        setState(() {
                          avgFiberDiameter = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Face Wool Cover
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Face Wool Cover',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onSaved: (value) {
                        setState(() {
                          faceWoolCover = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10.0),

                  // Skin Wrinkles
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Skin Wrinkles',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onSaved: (value) {
                        setState(() {
                          skinWrinkles = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save the form data
                        _formKey.currentState!.save();

                        // Perform actions with the form field values
                        // For example, you can print them:
                        print('Grease Fleece Weight: $greaseFleeceWeight');
                        print('Clean Fleece Weight: $cleanFleeceWeight');
                        print('Staple Length: $stapleLength');
                        print('Average Fiber Diameter: $avgFiberDiameter');
                        print('Face Wool Cover: $faceWoolCover');
                        print('Skin Wrinkles: $skinWrinkles');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            )
          ])),
    );
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Update the _imageFile variable with the picked image file.
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      // User canceled the image picker.
    }
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Update the _imageFile variable with the picked image file.
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      // User canceled the image picker.
    }
  }

  @override
  void dispose() {
    _imageFile
        ?.delete(); // Delete the picked image when the widget is disposed.
    super.dispose();
  }
}
