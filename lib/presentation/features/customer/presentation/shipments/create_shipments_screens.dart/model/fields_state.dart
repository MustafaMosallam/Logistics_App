import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldsState {
  final bool isValid;
  final bool isFirstValid;
  final bool isSecondValid;
  final bool isThirdValid;
  final String? firstErrorMessage;
  final String? secondErrorMessage;
  final String? thirdErrorMessage;

  FieldsState({
    this.firstErrorMessage,
    this.secondErrorMessage,
    this.thirdErrorMessage,
    this.isFirstValid = false,
    this.isSecondValid = false,
    this.isThirdValid = false,

    required this.isValid,
  });

  factory FieldsState.initial() {
    return FieldsState(
      isFirstValid: false,
      isSecondValid: false,
      isThirdValid: false,
      isValid: false,

      firstErrorMessage: null,
      secondErrorMessage: null,
      thirdErrorMessage: null,
    );
  }

  // FieldsState copyWith({
  //   bool? isFirstValid,
  //   bool? isSecondValid,
  //   bool? isThirdValid,
  //   bool isValid = false,
  //   String? error,
  // }) {
  //   return FieldsState(
  //     isFirstValid: isFirstValid ?? this.isFirstValid,
  //     isSecondValid: isSecondValid ?? this.isSecondValid,
  //     isThirdValid: isThirdValid ?? this.isThirdValid,
  //     isValid: isValid,
  //     errorMessgae: isValid ? error : errorMessgae,
  //   );
  // }
  FieldsState copyWith({
    bool? isFirstValid,
    bool? isSecondValid,
    bool? isThirdValid,
    String? firstError,
    String? secondError,
    String? thirdError,
    bool updateFirstError = false,
    bool updateSecondError = false,
    bool updateThirdError = false,
  }) {
    final newIsFirstValid = isFirstValid ?? this.isFirstValid;
    final newIsSecondValid = isSecondValid ?? this.isSecondValid;
    final newIsThirdValid = isThirdValid ?? this.isThirdValid;

    return FieldsState(
      isFirstValid: newIsFirstValid,
      isSecondValid: newIsSecondValid,
      isThirdValid: newIsThirdValid,
      isValid: newIsFirstValid && newIsSecondValid && newIsThirdValid,
      firstErrorMessage: updateFirstError ? firstError : firstErrorMessage,
      secondErrorMessage: updateSecondError ? secondError : secondErrorMessage,
      thirdErrorMessage: updateThirdError ? thirdError : thirdErrorMessage,
    );
  }
}
