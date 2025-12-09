import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/function/shared_pref.dart';
import 'package:our_market_admin/core/models/product_model.dart';
import 'package:our_market_admin/core/services/api_sevices.dart';
import 'package:our_market_admin/core/services/sensitive_data.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final ApiSevices _apiSevices = ApiSevices();
  final List<ProductModel> products = [];
  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiSevices.getData("products", token);
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetProductsSuccess());
    } catch (e) {
      emit(GetProductsError());
    }
  }

  String? imageUrl = "";
  Future<void> uploadImage({
    required Uint8List image,
    required String imageName,
    required String bucketName,
  }) async {
    emit(UploadImageLoading());
    const String storageBaseUrl =
        "https://mxgcypikbuuipodksmqe.supabase.co/storage/v1/object";
    const String apiKey = anonKey;
    final String? token = await SharedPref.getToken();
    final String uploadUrl = "$storageBaseUrl/$bucketName/$imageName";
    final Dio dio = Dio();
    FormData data = FormData.fromMap({
      "file": MultipartFile.fromBytes(image, filename: imageName),
    });
    try {
      Response response = await dio.post(
        data: data,
        uploadUrl,
        options: Options(
          headers: {
            "apikey": apiKey,
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      if (response.statusCode == 200) {
        emit(UploadImgaeScuccess());
        imageUrl =
            "https://mxgcypikbuuipodksmqe.supabase.co/storage/v1/object/public/${response.data["Key"]}";
        print(imageUrl);
      } else {
        emit(UploadImageError());
      }
    } catch (err) {
      emit(UploadImageError());
    }
  }

  Future<void> editProduct({
    required String productId,
    required Map<String, dynamic> data,
  }) async {
    emit(EditProductLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiSevices.patchData(
        "products?product_id=eq.$productId",
        data,
        token,
      );
      if (response.statusCode == 204) emit(EditProductScuccess());
    } catch (err) {
      emit(EditProductError());
    }
  }
}
