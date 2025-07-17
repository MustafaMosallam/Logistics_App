class GetCodeState {
  final String code;
  final bool isCodeValid;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  GetCodeState({
    required this.code,
    required this.isCodeValid,
    required this.isLoading,
    this.errorMessage,
    this.successMessage,
  });

  factory GetCodeState.initial() => GetCodeState(
    code: '',
    isCodeValid: false,
    isLoading: false,
    errorMessage: null,
    successMessage: null,
  );
  GetCodeState copyWith({
    String? code,
    bool? isCodeValid,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) {
    return GetCodeState(
      code: code ?? this.code,
      isCodeValid: isCodeValid ?? this.isCodeValid,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
