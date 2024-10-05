import 'package:chapacosales/models/order.dart';
import 'package:chapacosales/models/table_state.dart';

class CustomerTable {
  int id;
  int? tableNumber;
  TableState state;
  List<Order> orderList;

  CustomerTable({
    required this.id,
    this.tableNumber,
    required this.state,
    required this.orderList,
  });
}
