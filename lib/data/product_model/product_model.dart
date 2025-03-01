import 'package:chairy_app/resources/assets_manager.dart';

class ProductModel {
  final String name;
  final String description;
  final int price;
  final String image;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

List<ProductModel> dummyProducts = [
  ProductModel(
    name: "Dining Table",
    description: "A sturdy, handcrafted oak dining table with a smooth finish, perfect for family gatherings",
    price: 799,
    image: ImageAssets.dinning,
  ),
  ProductModel(
    name: "Modern Sofa",
    description: "A plush, velvet-upholstered sofa with deep cushions and a sleek design for a contemporary living space.",
    price: 1199,
    image: ImageAssets.sofa,
  ),
  ProductModel(
    name: "Coffee Table",
    description: "A charming coffee table made from reclaimed wood, adding a natural touch to any room.",
    price: 299,
    image: ImageAssets.table,
  ),
  ProductModel(
    name: "Minimalist Bookshelf",
    description: "A sleek, open-frame bookshelf with multiple shelves, ideal for organizing books and decorative items.",
    price: 199,
    image: ImageAssets.shelf,
  ),
  ProductModel(
    name: "Leather Armchair",
    description: "A comfortable leather armchair with padded armrests and a vintage design for a timeless appeal.",
    price: 499,
    image: ImageAssets.leather,
  ),
  ProductModel(
    name: "Cool Nightstand",
    description: "A compact nightstand with a single drawer and an open shelf, featuring a minimalist Scandinavian aesthetic.",
    price: 149,
    image: ImageAssets.nightstand,
  ),

  ProductModel(
    name: "Industrial Stool",
    description: "A high-top bar stool with a metal frame and wooden seat, perfect for modern kitchen islands or bars.",
    price: 129,
    image: ImageAssets.stool,
  ),
];
