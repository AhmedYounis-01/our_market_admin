import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin/core/function/shared_pref.dart';
import 'package:our_market_admin/core/services/api_sevices.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final ApiSevices _apiSevices = ApiSevices();
  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());
    try {
      final response = await _apiSevices.login("token", data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        await SharedPref.saveToken(response.data["access_token"]);
        emit(LoginSuccess());
      } else {
        emit(LoginError(response.data["msg"]));
      }
    } catch (e) {
      print(e.toString());
      emit(LoginError("Something went wrong please try again"));
    }
  }
}
