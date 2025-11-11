import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_net_img.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String selectedValue = "Collections";
  String discount = "10";
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  // Uint8List? _selectedImage;
  // ignore: unused_field, prefer_final_fields
  String _imageName = "imageName";
  @override
  void dispose() {
    _productNameController.dispose();
    _newPriceController.dispose();
    _oldPriceController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Add Product"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownMenu(
                  onSelected: (String? value) {
                    setState(() {
                      selectedValue = value ?? "Collections";
                    });
                  },
                  initialSelection: selectedValue,
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "sports", label: "Sports"),
                    DropdownMenuEntry(
                      value: "electronics",
                      label: "Electronics",
                    ),
                    DropdownMenuEntry(
                      value: "collections",
                      label: "Collections",
                    ),
                    DropdownMenuEntry(value: "books", label: "Books"),
                    DropdownMenuEntry(value: "bikes", label: "Bikes"),
                  ],
                ),
                const SizedBox(width: 20),
                Column(children: [const Text("Sale"), Text("$discount %")]),
                Column(
                  children: [
                    const CustomNetworkImage(
                      url:
                          "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1736199951~exp=1736203551~hmac=4002ca903018a0edb3f886536eb961659f89a39eb31ee90a093c352ac11e5912&w=826",
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
            ),
            const SizedBox(height: 60),
            CustomTextField(
              labelText: "Product Name",
              controller: _productNameController,
            ),
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
                  child: Text("Add"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
