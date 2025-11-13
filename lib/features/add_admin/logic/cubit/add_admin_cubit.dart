// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/services/api_sevices.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  final ApiSevices _apiSevices = ApiSevices();
  Future<void> createAnAccout(Map<String, dynamic> data) async {
    emit(AddAdminLoading());
    try {
      Response response = await _apiSevices.createAnAccout("signup", data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AddAdminSuccess());
      } else {
        emit(AddAdminError(response.data["msg"]));
      }
    } catch (e) {
      emit(AddAdminError("Something went wrong please try again"));
    }
  }
}
