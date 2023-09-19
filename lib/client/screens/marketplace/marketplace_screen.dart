import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/marketplace/Tools.dart';
import 'package:sih1309/client/screens/news_api.dart';
import 'package:sih1309/utils/dimensions.dart';

import '../../../app_state.dart';
import '../../../utils/colors.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});


  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  final List<Product> products = [
    Product(title: 'Tools', imageUrl: 'https://i.imgur.com/Ak2Zg4X.png'),
    Product(title: 'Sheeps', imageUrl: 'https://i.imgur.com/HZWQHWR.png'),
    Product(title: 'Feed', imageUrl: 'https://i.imgur.com/bLXvljf.png'),
    // Add more products as needed
  ];
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
          title: Text("Marketplace ++ ",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'poppins',
                fontSize: Dimension.font20,
                fontWeight: FontWeight.w500,
              )),
        ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust the number of columns as needed
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductTile(product: product);
        },
      ),
    );
  }
}
class Product {
  final String title;
  final String imageUrl;

  Product({required this.title, required this.imageUrl});
}

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        // Handle tile click here, e.g., navigate to a new screen
      onTap: () {

        context.go('/marketplace/${product.title}');

      },
      child: Card(
        elevation: 5,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                product.imageUrl,
                width: 64.0,
                height: 64.0,
                fit: BoxFit.cover, // Adjust the fit as needed

            ),
            SizedBox(height: 8.0),

            Text(
              product.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
