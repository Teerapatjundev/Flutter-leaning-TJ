import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/models/products.dart';
import 'package:my_flutter_app/core/services/product/product_service.dart';

class HomeScreen extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onSaveCounter;

  const HomeScreen({
    Key? key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    required this.onSaveCounter,
  }) : super(key: key);

  void fetchProducts() async {
    final productService = ProductService();
    List<AssetModel> products = await productService.fetchProductAssetCms();

    for (var product in products) {
      print("product: ${product.toJson()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Count: $count",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: onDecrement, child: Text("-")),
            SizedBox(width: 20),
            ElevatedButton(onPressed: onIncrement, child: Text("+")),
          ],
        ),
        ElevatedButton(onPressed: onSaveCounter, child: const Text('Save')),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: fetchProducts,
          child: const Text('Fetch Products'),
        ),
      ],
    );
  }
}
