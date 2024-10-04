import 'package:chapacosales/models/product.dart';

class OrderProduct {
  Product product;
  int quantity;
  double accPrice;

  OrderProduct({
    required this.product,
    required this.quantity,
    required this.accPrice,
  });
}
