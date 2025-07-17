import 'package:app/constants/api_path.dart';
import 'package:app/presentation/features/auth/get_code/getCode_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:app/constants/app_strings.dart';
import 'dart:developer';

class GetcodeViewmodel extends StateNotifier<GetCodeState> {
  GetcodeViewmodel() : super(GetCodeState.initial());
  final dio = Dio();

  Future<void> sendCode({required String email}) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    );

    try {
      await Future.delayed(Duration(seconds: 1));
      final Response response = await dio.post(
        "${ApiPath.baseUrl}/auth/forgotPassword",
        data: {"email": email},
      );

      state = state.copyWith(
        isLoading: false,
        successMessage: "تم إرسال الكود بنجاح",
      );
      log("statuscode: ${response.data}");
      log("getCodeWorkedwell");
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      log("getCodeError $e");
    }
  }
}

final getCodeProvider = StateNotifierProvider<GetcodeViewmodel, GetCodeState>((
  ref,
) {
  return GetcodeViewmodel();
});
