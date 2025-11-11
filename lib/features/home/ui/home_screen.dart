import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';
import 'package:our_market_admin/core/function/navigate_to.dart';
import 'package:our_market_admin/features/add_admin/ui/add_admin.dart';
import 'package:our_market_admin/features/add_product/ui/add_product.dart';
import 'package:our_market_admin/features/products/ui/products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Home", isBackButton: false),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.shopping_bag, size: 30),
                ],
              ),
              onPressed: () => navigateTo(context, const ProductsScreen()),
            ),
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Product",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.add_circle_outline, size: 30),
                ],
              ),
              onPressed: () => navigateTo(context, const AddProductScreen()),
            ),
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add An Admin",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.person_add, size: 30),
                ],
              ),
              onPressed: () => navigateTo(context, const AddAdminScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
