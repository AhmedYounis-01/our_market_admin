import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/function/shared_pref.dart';
import 'package:our_market_admin/core/models/product_model.dart';
import 'package:our_market_admin/core/services/api_sevices.dart';

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
}
