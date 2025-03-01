enum AuthMode { signIn, signUp }

abstract class RegisterState {}

class RegisterStepState extends RegisterState {
  final int stepIndex;
  final AuthMode authMode;

  RegisterStepState({required this.stepIndex, required this.authMode});
}