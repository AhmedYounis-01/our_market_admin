import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/components/custom_circular_ind.dart';
import 'package:our_market_admin/core/components/custom_product_card.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';
import 'package:our_market_admin/core/function/navigate_without_back.dart';
import 'package:our_market_admin/core/function/show_msg.dart';
import 'package:our_market_admin/features/home/ui/home_screen.dart';
import 'package:our_market_admin/features/products/logic/cubit/products_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: Scaffold(
        appBar: buildCustomAppBar(context, "Products"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<ProductsCubit, ProductsState>(
            listener: (context, state) {
              if (state is DeleteProductSuccess) {
                navigateWithoutBack(context, const HomeScreen());
                showMsg(context, "Product deleted successfully");
              }
            },
            builder: (context, state) {
              final ProductsCubit cubit = context.read<ProductsCubit>();
              return state is GetProductsLoading ||
                      state is DeleteProductLoading
                  ? const CustomCircularIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) => CustomProductCard(
                          product: cubit.products[index],
                          deleteProduct: () => cubit.deleteProduct(
                            productId: cubit.products[index].productId,
                          ),
                        ),
                        itemCount: cubit.products.length,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
