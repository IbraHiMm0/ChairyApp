import 'package:bloc/bloc.dart';
import 'package:chairy_app/presentation/register/register_view/register_state.dart';
import 'package:meta/meta.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStepState(stepIndex: 0, authMode: AuthMode.signIn));

  void toggleAuthMode() {
    if (state is RegisterStepState) {
      emit(RegisterStepState(
        stepIndex: (state as RegisterStepState).stepIndex,
        authMode: (state as RegisterStepState).authMode == AuthMode.signIn ? AuthMode.signUp : AuthMode.signIn,
      ));
    }
  }

  void nextStep() {
    if (state is RegisterStepState) {
      int nextIndex = (state as RegisterStepState).stepIndex + 1;
      if (nextIndex < 5) {
        emit(RegisterStepState(
          stepIndex: nextIndex,
          authMode: (state as RegisterStepState).authMode,
        ));
      }
    }
  }

  void previousStep() {
    if (state is RegisterStepState) {
      int prevIndex = (state as RegisterStepState).stepIndex - 1;
      if (prevIndex >= 0) {
        emit(RegisterStepState(
          stepIndex: prevIndex,
          authMode: (state as RegisterStepState).authMode,
        ));
      }
    }
  }
}

