import 'package:revive_app/Models/ProductsModel/productmodel.dart';

abstract class ProductEvents {}

class AddProductRequested extends ProductEvents {
  final Product product;

  AddProductRequested({required this.product});
}
