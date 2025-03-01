part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class AppChangeBottomNavBar extends MainState {}

class BottomNavState extends MainState {}

class ProductDetailsState extends MainState {}
class SearchState extends MainState {}
class MenuState extends MainState {}

class CartState extends MainState {}

class CartUpdatedState extends MainState {}
class CartRemoveState extends MainState {}
class ProductQuantityUpdatedState extends MainState {}
class ToggleSelectedState extends MainState {}
class PaymentOptionChanged extends MainState {}
class AddressUpdated extends MainState {}
class NameUpdated extends MainState {}
