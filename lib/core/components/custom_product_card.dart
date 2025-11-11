import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_net_img.dart';
import 'package:our_market_admin/core/function/navigate_to.dart';
import 'package:our_market_admin/features/products/ui/comment_screen.dart';
import 'custom_elevated_button.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    // required this.product,
    // this.deleteProduct,
  });

  // final ProductModel product;
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
            CustomNetworkImage(
              height: 150,
              width: 200,
              url:
                  "https://images.unsplash.com/photo-1491933382434-500287f9b54b?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=764",
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("Product Description", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.edit),
                  onPressed: () {
                    // navigateTo(context, EditProductScreen(product: product)),
                  },
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  "Product Price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("100 EG", style: TextStyle(fontSize: 18)),
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
                // onPressed: deleteProduct,
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
