part of 'menu_cubit.dart';


abstract class MenuState extends Equatable {
  final bool isEnglish;
  final bool isLightMode;

  const MenuState({required this.isEnglish, required this.isLightMode});

  @override
  List<Object> get props => [isEnglish, isLightMode];
}

class MenuInitial extends MenuState {
  const MenuInitial({required super.isEnglish, required super.isLightMode});
}

class ChangeLanguageState extends MenuState {
  const ChangeLanguageState({required super.isEnglish, required super.isLightMode});
}

class ChangeThemeState extends MenuState {
  const ChangeThemeState({required super.isEnglish, required super.isLightMode});
}

