import 'package:chairy_app/presentation/cart/cart_view/cart_view.dart';
import 'package:chairy_app/presentation/category/category_view/category_view.dart';
import 'package:chairy_app/presentation/home/home_view/home_view.dart';
import 'package:chairy_app/presentation/menu/menu_view/menu_view.dart';
import 'package:chairy_app/presentation/productDetails/productDetails_view/productDetails_view.dart';
import 'package:chairy_app/resources/string_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/main/main_screen/main_screen.dart';
import '../presentation/register/register_view/register_view.dart';
import '../presentation/search/search_view/search_view.dart';
import '../presentation/splash/splash_view/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String searchRoute = "/search";
  static const String menuRoute = "/menu";
  static const String homeRoute = "/home";
  static const String mainRoute = "/main";
  static const String cartRoute = "/cart";
  static const String categoryRoute = "/category";
  static const String productDetailsRoute = "/productDetails";
  static const String registerRoute = "/register";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchView());
      case Routes.menuRoute:
        return MaterialPageRoute(builder: (_) =>  const MenuView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>  const HomeView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) =>  const MainScreen());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) =>  const CartView());
      case Routes.categoryRoute:
        return MaterialPageRoute(builder: (_) =>  const CategoryView());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) =>  const ProductDetails());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) =>   RegisterView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
