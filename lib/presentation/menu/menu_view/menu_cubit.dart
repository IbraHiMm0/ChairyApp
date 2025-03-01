import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuInitial(isEnglish: true, isLightMode: true));

  void toggleLanguage() {
    emit(ChangeLanguageState(isEnglish: !state.isEnglish, isLightMode: state.isLightMode));
  }

  void toggleTheme() {
    print("Current theme: ${state.isLightMode ? "Light" : "Dark"}"); // Debugging
    emit(ChangeThemeState(isEnglish: state.isEnglish, isLightMode: !state.isLightMode));
    print("New theme: ${!state.isLightMode ? "Dark" : "Light"}"); // Debugging
  }
}
