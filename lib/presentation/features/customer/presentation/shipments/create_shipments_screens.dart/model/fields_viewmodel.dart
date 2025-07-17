import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/fields_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldsViewmodel extends StateNotifier<FieldsState> {
  FieldsViewmodel() : super(FieldsState.initial());

  void resetState() {
    state = FieldsState.initial();
  }

  void onFirstChange(String text) {
    _validateFirst(text);
  }

  void onSecondChange(String text) {
    _validateSecond(text);
  }

  void onThirdChange(String text) {
    _validateThird(text);
  }

  void _validateFirst(String text) {
    bool valid = text.isNotEmpty;
    String? error = valid ? null : "هذا الحقل مطلوب";

    state = state.copyWith(
      isFirstValid: valid,
      firstError: error,
      updateFirstError: true,
    );
  }

  void _validateSecond(String text) {
    bool valid = text.isNotEmpty;
    String? error = valid ? null : "هذا الحقل مطلوب";

    state = state.copyWith(
      isSecondValid: valid,
      secondError: error,
      updateSecondError: true,
    );
  }

  void _validateThird(String text) {
    bool valid = text.isNotEmpty;
    String? error = valid ? null : "هذا الحقل مطلوب";

    state = state.copyWith(
      isThirdValid: valid,
      thirdError: error,
      updateThirdError: true,
    );
  }
}

final fieldsStateProvider = StateNotifierProvider<FieldsViewmodel, FieldsState>(
  (ref) {
    return FieldsViewmodel();
  },
);
