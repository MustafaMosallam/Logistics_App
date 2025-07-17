import 'dart:convert';
import 'dart:developer';

import 'package:app/constants/api_path.dart';
import 'package:app/presentation/features/auth/register/register_state.dart';
import 'package:app/presentation/features/auth/register/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewmodel extends StateNotifier<UserState> {
  final Ref ref;
  LoginViewmodel(this.ref) : super(UserState.initial());

  final dio = Dio();
  void onPhoneChanged(String phone) {
    state = state.copyWith(phoneNumber: phone.trim());
    _validatePhoneNumber();
    log("isFormValid:${state.isFormValid}");
  }

  void validate() {
    _validatePhoneNumber();
  }

  void _validatePhoneNumber() {
    final phoneNumber = state.phoneNumber;
    String? error;
    bool? isValid = true;

    if (phoneNumber.isEmpty) {
      error = 'رقم الهاتف مطلوب';
      isValid = false;
    }

    final normalized = phoneNumber.replaceAll(RegExp(r'\s+'), '');

    final regex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');

    if (!regex.hasMatch(normalized)) {
      error = 'رقم الهاتف غير صالح. تأكد من إدخاله بشكل صحيح';
      isValid = false;
    }
    log("error:$error");
    state = state.copyWith(
      isFormValid: isValid,
      phoneError: error,
      updatePhoneError: true,
    );
    log("error message:${state.errorMessage}");
  }

  Future<void> login() async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );
    try {
      await Future.delayed(Duration(seconds: 1));
      print(ApiPath.login);

      Response response = await dio.post(
        ApiPath.login,
        data: jsonEncode({
          "email": "pi.kareem14@gmail.com",
          "password": "password123",
        }),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      log("response status code: ${response.statusCode}");
      log("response status message: ${response.statusMessage}");

      if (response.statusCode != 200) {
        if (response.data["status"] == "fail") {
          state = state.copyWith(
            isLoading: false,
            errorMessage: "هذا الحساب غير مسجل",
          );
          return;
        }
      }

      final token = response.data['token'];
      final userMap = response.data['data']['user'];

      state = state.copyWith(
        isLoading: false,
        successMessage: 'تم التسجيل بنجاح',
        // user: UserModel.fromJson(userMap),
        token: token,
      );
      final user = UserModel.fromJson({...userMap, 'token': token});
      log("user returned : $user");

      ref.read(authenticatedUserProvider.notifier).state = user;
    } catch (error) {
      if (error is DioException && error.response != null) {
        log("response status code: ${error.response?.statusCode}");
        log("response status message: ${error.response?.statusMessage}");
        log("response data: ${error.response?.data}");
        if (error.response?.data["status"] == "fail") {
          state = state.copyWith(
            isLoading: false,
            errorMessage: "هذا الحساب غير مسجل",
          );
          return;
        }
      }

      log('Error during login: $error');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'حدث خطأ أثناء التسجيل. يرجى المحاولة مرة أخرى.',
      );
    }
  }
}

final loginUserProvider = StateNotifierProvider<LoginViewmodel, UserState>((
  ref,
) {
  return LoginViewmodel(ref);
});
