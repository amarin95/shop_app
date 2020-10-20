import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/product.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    final productsData =Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ProductItem(
        products[index].id,
        products[index].title,
        products[index].imageUrl,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
