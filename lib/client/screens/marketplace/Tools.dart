import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sih1309/client/screens/news_api.dart';
import 'package:sih1309/utils/dimensions.dart';

import '../../../app_state.dart';
import '../../../utils/Product.dart';
import '../../../utils/colors.dart';

class Tools extends StatefulWidget {
  const Tools({super.key});


  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  final List<Product> products = [
    Product(name: 'Blade Shears', imageUrl: 'https://i.imgur.com/N8yvHp4.jpg', price: 19.99, uses: 'Use case 1'),
    Product(name: 'Wool', imageUrl: 'https://i.imgur.com/JmpGukD.jpg', price: 29.99, uses: 'Use case 2'),
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
          title: Text("Tools ${products.length}",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'poppins',
                fontSize: Dimension.font20,
                fontWeight: FontWeight.w500,
              )),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Adjust the number of columns as needed
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        )
    );
  }
}
class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Image.network(
        product.imageUrl,
        width: 64.0,
        height: 64.0,
        fit: BoxFit.cover, // Adjust the fit as needed

      ),
      title: Text(product.name),
      subtitle: Text(product.uses),
      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
      onTap: () {
        // Handle tapping on a product, e.g., navigate to a product details screen
      },
    );
  }
}
class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading:  Image.network(
              product.imageUrl,
              width: 64.0,
              height: 64.0,
              fit: BoxFit.cover, // Adjust the fit as needed

            ),
            title: Text(product.name),
            subtitle: Text(product.uses),
            trailing: Text('\$${product.price.toStringAsFixed(2)}'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle the Buy button click here
                    // You can add navigation or other actions as needed
                  },
                 // color: Colors.blue,
                  //textColor: Colors.white,
                  child: Text("Buy"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

