import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/components/custom_circular_ind.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_filed.dart';
import 'package:our_market_admin/core/function/custom_appbar.dart';
import 'package:our_market_admin/core/function/file_picker.dart';
import 'package:our_market_admin/core/function/navigate_without_back.dart';
import 'package:our_market_admin/core/models/product_model.dart';
import 'package:our_market_admin/features/home/ui/home_screen.dart';
import 'package:our_market_admin/features/products/logic/cubit/products_cubit.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key, required this.product});
  final ProductModel product;

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
    selectedValue = widget.product.category;
    discount = widget.product.sale.toString();
    _productNameController.text = widget.product.productName;
    _newPriceController.text = widget.product.price.toString();
    _oldPriceController.text = widget.product.oldPrice.toString();
    _productDescriptionController.text = widget.product.description;

    super.initState();
  }

  Uint8List? _selectedImage;
  String _imageName = "imageName";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is EditProductScuccess) {
            navigateWithoutBack(context, const HomeScreen());
          }
        },
        builder: (context, state) {
          final ProductsCubit cubit = context.read<ProductsCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(context, "Edit Product"),
            body: state is EditProductLoading
                ? const CustomCircularIndicator()
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        _buildEditProduct(state, cubit),
                        const SizedBox(height: 60),
                        CustomTextField(
                          labelText: "Product Name",
                          controller: _productNameController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^(\d+)?\.?\d{0,2}'),
                            ),
                          ],
                          labelText: "Old Price (Before Discount)",
                          controller: _oldPriceController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^(\d+)?\.?\d{0,2}'),
                            ),
                          ],
                          labelText: "New Price (After Discount)",
                          controller: _newPriceController,
                          onChanged: (String val) {
                            double x =
                                ((double.parse(_oldPriceController.text) -
                                    double.parse(val)) /
                                double.parse(_oldPriceController.text) *
                                100);
                            setState(() {
                              discount = x.round().toString();
                            });
                          },
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
                            onPressed: () async {
                              // String? token = await SharedPref.getToken();
                              // log("test token >>>>>>>>>>>>>>>> $token");
                              await cubit.editProduct(
                                productId: widget.product.productId,
                                data: {
                                  "product_name": _productNameController.text,
                                  "price": _newPriceController.text,
                                  "old_price": _oldPriceController.text,
                                  "sale": discount,
                                  "description":
                                      _productDescriptionController.text,
                                  "category": selectedValue,
                                  "image_url": cubit.imageUrl!.isEmpty
                                      ? widget.product.imageUrl
                                      : cubit.imageUrl,
                                },
                              );
                            },
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
        },
      ),
    );
  }

  Row _buildEditProduct(ProductsState state, ProductsCubit cubit) {
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
                    imageUrl: widget.product.imageUrl,
                    height: 200,
                    width: 300,
                  ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomElevatedButton(
                  child: const Icon(Icons.image),
                  onPressed: () async {
                    await pickFile().then((value) {
                      if (value != null) {
                        setState(() {
                          Uint8List? bytes = value.files.first.bytes;
                          _selectedImage = bytes;
                          _imageName = value.files.first.name;
                        });
                      }
                    });
                  },
                ),
                const SizedBox(width: 10),
                CustomElevatedButton(
                  onPressed: state is UploadImageLoading
                      ? null
                      : () async {
                          if (_selectedImage != null) {
                            cubit.uploadImage(
                              image: _selectedImage!,
                              imageName: _imageName,
                              bucketName: "Images",
                            );
                          }
                        },
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
          selectedValue = value ?? "Collections";
        });
      },
      initialSelection: widget.product.category, // "collections",
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: "Sports", label: "Sports"),
        DropdownMenuEntry(value: "Electronics", label: "Electronics"),
        DropdownMenuEntry(value: "Collections", label: "Collections"),
        DropdownMenuEntry(value: "Books", label: "Books"),
        DropdownMenuEntry(value: "Bikes", label: "Bikes"),
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
