import 'dart:convert';
import 'dart:developer';

import 'package:app/constants/api_path.dart';
import 'package:app/presentation/features/auth/register/register_state.dart';
import 'package:app/presentation/features/auth/register/user_model.dart';
import 'package:app/presentation/features/auth/register/user_role_model.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterViewmodel extends StateNotifier<UserState> {
  final Ref ref;
  RegisterViewmodel(this.ref) : super(UserState.initial());

  final dio = Dio();

  void onChooseRole(UserRoleModel userType) {
    state = state.copyWith(role: userType);
  }

  void resetState() {
    state = UserState.initial();
  }

  void validateAllFields() {
    _validateEmail();
    _validateName();
    _validatePhoneNumber();
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email.trim());
    _validateEmail();
    // _validateForm();
  }

  void onNameChanged(String name) {
    state = state.copyWith(name: name);
    _validateName();
    // _validateForm();
  }

  void onPhoneNumberChanged(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
    _validatePhoneNumber();
    // _validateForm();
  }

  void _validateEmail() {
    final email = state.email.trim();
    String? error;
    bool? isValid = true;

    if (email.isEmpty) {
      error = 'البريد الإلكتروني مطلوب';
      isValid = false;
    } else if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$').hasMatch(email)) {
      error = 'البريد الإلكتروني غير صالح. تأكد من إدخاله بشكل صحيح';
      isValid = false;
    }

    final formValid = isValid && state.isNameValid && state.isPhoneValid;
    state = state.copyWith(
      emailError: error,
      isEmailValid: isValid,
      isFormValid: formValid,
      updateEmailError: true,
    );
  }

  void _validateName() {
    final name = state.name.trim();
    String? error;
    bool? isValid = true;

    if (name.isEmpty) {
      error = 'الاسم مطلوب';
      isValid = false;
    } else if (name.split(RegExp(r'\s+')).length < 2) {
      error = 'يجب إدخال الاسم الكامل (الاسم واللقب)';
      isValid = false;
    } else if (!RegExp(r'^[\p{L}\s]+$', unicode: true).hasMatch(name)) {
      error = 'الاسم يجب أن يحتوي على أحرف بدون أرقام أو رموز';
      isValid = false;
    }

    final formValid = isValid && state.isEmailValid && state.isPhoneValid;
    state = state.copyWith(
      isNameValid: isValid,
      nameError: error,
      isFormValid: formValid,
      updateNameError: true,
    );
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

    final formValid = isValid && state.isNameValid && state.isEmailValid;
    state = state.copyWith(
      isPhoneValid: isValid,
      phoneError: error,
      isFormValid: formValid,
      updatePhoneError: true,
    );
  }

  Future<void> register() async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );
    try {
      await Future.delayed(Duration(seconds: 1));
      print(ApiPath.registerMerchant);

      Response response = await dio.post(
        ApiPath.registerMerchant,
        data: jsonEncode({
          "name": state.name,
          "email": state.email,
          "password": "dummy_password",
          "phone": state.phoneNumber,
          "role": state.role.name,
        }),
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      log("response status code: ${response.statusCode}");
      log("response status message: ${response.statusMessage}");

      final token = response.data['token'];
      final userMap = response.data['data']['user'];

      state = state.copyWith(
        isLoading: false,
        successMessage: 'تم التسجيل بنجاح',
        // user: UserModel.fromJson(userMap),
        token: token,
      );
      final user = UserModel.fromJson({...userMap, 'token': token});
      ref.read(authenticatedUserProvider.notifier).state = user;
    } catch (error) {
      if (error is DioException && error.response != null) {
        log("response status code: ${error.response?.statusCode}");
        log("response status message: ${error.response?.statusMessage}");
        log("response data: ${error.response?.data}");
        if (error.response?.data["status"] == "fail") {
          state = state.copyWith(
            isLoading: false,
            errorMessage: "هذا الحساب مسجل بالفعل",
          );
          return;
        }
      }

      log('Error during registration: $error');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'حدث خطأ أثناء التسجيل. يرجى المحاولة مرة أخرى.',
      );
    }
  }
}

final registerUserProvider =
    StateNotifierProvider<RegisterViewmodel, UserState>((ref) {
      return RegisterViewmodel(ref);
    });
