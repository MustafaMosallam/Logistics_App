import 'package:app/presentation/features/auth/register/user_model.dart';
import 'package:app/presentation/features/auth/register/user_role_model.dart';

class UserState {
  final String name;
  final String email;
  final String phoneNumber;
  final UserRoleModel role;
  final bool isFormValid;
  final bool isNameValid;
  final bool isEmailValid;
  final bool isPhoneValid;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  // final UserModel? user;
  final String? token;
  final String? nameError;
  final String? emailError;
  final String? phoneError;
  final bool isLogin;

  UserState({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    this.isFormValid = false,
    this.isNameValid = false,
    this.isEmailValid = false,
    this.isPhoneValid = false,
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
    // this.user,
    this.token,
    this.nameError,
    this.emailError,
    this.phoneError,
    required this.isLogin,
  });

  factory UserState.initial() {
    return UserState(
      email: '',
      name: '',
      phoneNumber: '',
      isFormValid: false,
      isLoading: false,
      role: UserRoleModel.merchant,
      errorMessage: null,
      successMessage: null,
      // user: null,
      token: null,
      nameError: null,
      emailError: null,
      phoneError: null,
      isLogin: false,
    );
  }

  UserState copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    UserRoleModel? role,
    bool? isFormValid,
    bool? isNameValid,
    bool? isEmailValid,
    bool? isPhoneValid,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    // UserModel? user,
    String? token,
    String? nameError,
    String? emailError,
    String? phoneError,
    bool updateNameError = false,
    bool updateEmailError = false,
    bool updatePhoneError = false,
    bool isLogin = false,
  }) {
    return UserState(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      isFormValid: isFormValid ?? this.isFormValid,
      isNameValid: isNameValid ?? this.isNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      // user: user ?? this.user,
      token: token ?? this.token,
      isLogin: this.isLogin,
      nameError: updateNameError ? nameError : this.nameError,
      emailError: updateEmailError ? emailError : this.emailError,
      phoneError: updatePhoneError ? phoneError : this.phoneError,
    );
  }
}
