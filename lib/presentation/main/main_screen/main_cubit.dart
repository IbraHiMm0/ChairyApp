import 'package:bloc/bloc.dart';
import 'package:chairy_app/presentation/cart/cart_view/cart_view.dart';
import 'package:chairy_app/presentation/category/category_view/category_view.dart';
import 'package:chairy_app/presentation/home/home_view/home_view.dart';
import 'package:chairy_app/presentation/menu/menu_view/menu_view.dart';
import 'package:chairy_app/presentation/productDetails/productDetails_view/productDetails_view.dart';
import 'package:chairy_app/presentation/register/register_view/register_view.dart';
import 'package:chairy_app/presentation/search/search_view/search_view.dart';
import 'package:chairy_app/resources/assets_manager.dart';
import 'package:chairy_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import '../../../data/product_model/product_model.dart';
part 'main_state.dart';
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  final PageController pageController = PageController();

  /// Scroll Controller for Category View
  final ScrollController categoryScrollController = ScrollController();

  ProductModel? selectedProduct; // Store selected product
  int? selectedProductIndex; // Store the index of the selected product
  List<ProductModel> cartItems = [];

  int getTotalCartItems() {
    return productQuantities.values.fold(0, (sum, quantity) => sum + quantity);
  }

  List<BottomNavigationBarItem> get bottomItems => [
    BottomNavigationBarItem(
      icon: Image.asset(
        ImageAssets.homeIcon,
        width: 32.h,
        height: 32.h,
        color: currentIndex == 0 ? ColorManager.primary : ColorManager.grey,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        ImageAssets.categoryIcon,
        width: 32.h,
        height: 32.h,
        color: currentIndex == 1 ? ColorManager.primary : ColorManager.grey,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          final cubit = MainCubit.get(context);
          int cartCount = cubit.getTotalCartItems(); // Get total item count
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                ImageAssets.cartIcon,
                width: 32.h,
                height: 32.h,
                color: currentIndex == 2 ? ColorManager.primary : ColorManager.grey,
              ),
              if (cartCount > 0) // Show badge only if cart has items
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: ColorManager.primary, // Badge color
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartCount.toString(), // Display cart count
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      label: '',
    ),
  ];

  final List<Widget> screens = [
    const HomeView(),
    const CategoryView(),
    const CartView(),
    const ProductDetails(),
    RegisterView(),
    const SearchView(),
    const MenuView()
  ];

  /// Changes bottom navigation index and updates the UI.
  void changeBottomNavBar(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(BottomNavState());
  }

  /// Navigate to Product Details Page
  void navigateToProductDetails(ProductModel product, int index) {
    selectedProductIndex = index; // Store the index
    selectedProduct = product;
    pageController.jumpToPage(3); // Navigate to ProductDetails page
    emit(ProductDetailsState());
  }
  void navigateToSearchView() {
    pageController.jumpToPage(5);
    emit(SearchState());
  }
  void navigateToMenuView() {
    pageController.jumpToPage(6);
    emit(MenuState());
  }
  /// Go Back to Category View and scroll to tapped product
  void goBack() {
    currentIndex = 1; // Ensure CategoryView is selected
    pageController.jumpToPage(1); // Navigate back to Category View
    emit(BottomNavState());

    // Ensure scrolling happens after the UI rebuilds
    Future.delayed(const Duration(milliseconds: 300), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (selectedProductIndex != null && categoryScrollController.hasClients) {
          categoryScrollController.animateTo(
            selectedProductIndex! * 250.0, // Adjust scrolling position
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  final Map<ProductModel, int> productQuantities = {};

  void addToCart(ProductModel product) {
    if (productQuantities.containsKey(product)) {
      productQuantities[product] = (productQuantities[product] ?? 0) + 1;
    } else {
      productQuantities[product] = 1;
      cartItems.add(product);
    }
    emit(CartUpdatedState());
  }

  void increaseQuantity(ProductModel product) {
    if (productQuantities.containsKey(product)) {
      productQuantities[product] = (productQuantities[product] ?? 0) + 1;

    }
    emit(CartUpdatedState());
  }

  void decreaseQuantity(ProductModel product) {
    if (productQuantities.containsKey(product) && productQuantities[product]! > 1) {
      productQuantities[product] = (productQuantities[product] ?? 0) - 1;
    } else {
      cartItems.remove(product);
      productQuantities.remove(product);
    }
    emit(CartUpdatedState());
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    productQuantities.remove(product);
    emit(CartRemoveState()); // Update the UI
  }

  int getQuantity(ProductModel product) {
    return productQuantities[product] ?? 0;
  }

  double getTotalPrice() {
    return cartItems.fold(
        0, (total, product) => total + (product.price * (productQuantities[product] ?? 1)));
  }

  void navigateToCart() {
    pageController.jumpToPage(4);

    emit(CartState());
  }

  void goBackToCart() {
    currentIndex = 2;
    pageController.jumpToPage(2);
    emit(BottomNavState());
  }
  bool isSelected = true;
  void toggleSelected() {
    isSelected = !isSelected;
    emit(ToggleSelectedState());
  }
  List<String> selectedPaymentImage = [ImageAssets.visa, ImageAssets.masterCard]; // Default images

  String selectedPayment = "Card Payment"; // Default selected option
  void selectPayment(String payment) {
    selectedPayment = payment;
    switch (payment) {
      case "Card Payment":
        selectedPaymentImage = [ImageAssets.visa, ImageAssets.masterCard];
        break;
      case "Paypal":
        selectedPaymentImage = [ImageAssets.paypal];
        break;
      default:
        selectedPaymentImage = [];
        break;
    }
    emit(PaymentOptionChanged()); // Create this state
  }
  String city = '';
  String street = '';
  String buildingNumber = '';
  String first = '';
  String last = '';

  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  // Method to update address data
  void updateAddress(String newCity, String newStreet, String newBuildingNumber) {
    city = newCity;
    street = newStreet;
    buildingNumber = newBuildingNumber;
    emit(AddressUpdated());
  }

  void updateName(String firstName, String lastName) {
    first = firstName;
    last = lastName;
    emit(AddressUpdated());
  }


}
