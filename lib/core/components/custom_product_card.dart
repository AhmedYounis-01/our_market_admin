import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_net_img.dart';
import 'package:our_market_admin/core/function/navigate_to.dart';
import 'package:our_market_admin/core/models/product_model.dart';
import 'package:our_market_admin/features/products/ui/comment_screen.dart';
import 'package:our_market_admin/features/products/ui/edit_product_screen.dart';
import 'custom_elevated_button.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.product,
    // this.deleteProduct,
  });

  final ProductModel product;
  // final void Function()? deleteProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNetworkImage(height: 150, width: 200, url: product.imageUrl),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  product.productName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(product.description, style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.edit),
                  onPressed: () {
                    navigateTo(context, EditProductScreen(product: product));
                  },
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  product.price.toString(),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  product.oldPrice.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.comment),
                  onPressed: () => navigateTo(context, CommentsScreen()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [Icon(Icons.delete), Text("Delete")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
