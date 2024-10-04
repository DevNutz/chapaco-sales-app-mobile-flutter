import 'package:chapacosales/models/order_product.dart';

class Order {
  int tableId;
  List<OrderProduct> productList;

  Order({
    required this.tableId,
    required this.productList,
  });
}
