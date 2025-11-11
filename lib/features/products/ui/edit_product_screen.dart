import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});
  // final ProductModel product;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  String? selectedValue;
  String? discount;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  @override
  void initState() {
    // selectedValue = widget.product.category;
    // discount = widget.product.sale.toString();
    // _productNameController.text = widget.product.productName;
    // _newPriceController.text = widget.product.price.toString();
    // _oldPriceController.text = widget.product.oldPrice.toString();
    // _productDescriptionController.text = widget.product.description;

    super.initState();
  }

  Uint8List? _selectedImage;
  // String _imageName = "imageName";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Edit Product"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildEditProduct(),
            const SizedBox(height: 60),
            CustomTextField(
              labelText: "Product Name",
              controller: _productNameController,
            ),
            // 70
            const SizedBox(height: 10),
            CustomTextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              // ],
              labelText: "Old Price (Before Discount)",
              controller: _oldPriceController,
            ), // 249
            const SizedBox(height: 10),

            CustomTextField(
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              // ],
              labelText: "New Price (After Discount)",
              controller: _newPriceController,
              // onChanged: (String val) {
              //   double x =
              //       ((double.parse(_oldPriceController.text) -
              //           double.parse(val)) /
              //       double.parse(_oldPriceController.text) *
              //       100);
              //   setState(() {
              //     discount = x.round().toString();
              //   });
              // },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: "Product Description",
              controller: _productDescriptionController,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Update"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildEditProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCustomDropMenu(),
        const SizedBox(width: 20),
        Column(children: [const Text("Discount"), Text("$discount %")]),
        Column(
          children: [
            _selectedImage != null
                ? Image.memory(_selectedImage!, height: 200, width: 300)
                : CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170",
                    height: 200,
                    width: 300,
                  ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomElevatedButton(
                  child: const Icon(Icons.image),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                CustomElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.upload_file_rounded),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  DropdownMenu<String> _buildCustomDropMenu() {
    return DropdownMenu(
      onSelected: (String? value) {
        setState(() {
          selectedValue = value ?? "collections";
        });
      },
      initialSelection: selectedValue, // "collections",
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: "sports", label: "Sports"),
        DropdownMenuEntry(value: "electronics", label: "Electronics"),
        DropdownMenuEntry(value: "collections", label: "Collections"),
        DropdownMenuEntry(value: "books", label: "Books"),
        DropdownMenuEntry(value: "bikes", label: "Bikes"),
      ],
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _newPriceController.dispose();
    _oldPriceController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }
}

// sale = (double.parse(val) - double.parse(_newPriceController.text)) /
//                       double.parse(_newPriceController.text) *
//                       100;
