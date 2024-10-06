import 'package:chapacosales/models/order.dart';
import 'package:chapacosales/models/order_product.dart';
import 'package:chapacosales/models/product.dart';
import 'package:chapacosales/models/table.dart';
import 'package:chapacosales/models/table_state.dart';
import 'package:flutter/material.dart';

class TableProvider with ChangeNotifier {
  List<CustomerTable> _tables = [];

  List<CustomerTable> get tables => _tables;

  void initializeTables() {
    _tables = [
      CustomerTable(
        id: 1,
        tableNumber: 1,
        state: TableState.occupied,
        orderList: [
          Order(
            tableId: 1,
            productList: <OrderProduct>[
              OrderProduct(
                  product: Product(id: 1, name: "Cerveza Babaria 1.3L", price: 25.00),
                  quantity: 1,
                  accPrice: 25.00),
              OrderProduct(
                  product: Product(id: 2, name: "Cerveza Huari 750ML", price: 30.00),
                  quantity: 2,
                  accPrice: 60.00),
            ],
          ),
        ],
      ),
      CustomerTable(id: 2, tableNumber: 2, state: TableState.available, orderList: []),
      CustomerTable(id: 3, tableNumber: 3, state: TableState.reserved, orderList: []),
      CustomerTable(id: 4, tableNumber: 4, state: TableState.available, orderList: []),
      CustomerTable(id: 5, tableNumber: 5, state: TableState.reserved, orderList: []),
      CustomerTable(id: 6, tableNumber: 6, state: TableState.available, orderList: []),
      CustomerTable(id: 7, tableNumber: null, state: TableState.disabled, orderList: []),
      CustomerTable(id: 8, tableNumber: 7, state: TableState.available, orderList: []),
      CustomerTable(id: 9, tableNumber: 8, state: TableState.available, orderList: []),
      CustomerTable(id: 10, tableNumber: 9, state: TableState.occupied, orderList: []),
      CustomerTable(id: 11, tableNumber: 10, state: TableState.available, orderList: []),
      CustomerTable(id: 12, tableNumber: 11, state: TableState.available, orderList: []),
      CustomerTable(id: 13, tableNumber: 12, state: TableState.available, orderList: []),
      CustomerTable(id: 14, tableNumber: 13, state: TableState.available, orderList: []),
      CustomerTable(id: 15, tableNumber: null, state: TableState.disabled, orderList: []),
      CustomerTable(id: 16, tableNumber: null, state: TableState.disabled, orderList: []),
      CustomerTable(id: 17, tableNumber: 14, state: TableState.available, orderList: []),
      CustomerTable(id: 18, tableNumber: 15, state: TableState.available, orderList: []),
    ];

    notifyListeners();
  }

  void updateTableState(int tableId, TableState newState) {
    final tableIndex = _tables.indexWhere((table) => table.id == tableId);
    if (tableIndex != -1) {
      _tables[tableIndex].state = newState;
      notifyListeners();
    }
  }

  void addOrderToTable(int tableId, Order order) {
    final tableIndex = _tables.indexWhere((table) => table.id == tableId);
    if (tableIndex != -1) {
      _tables[tableIndex].orderList.add(order);
      _tables[tableIndex].state = TableState.occupied;
      notifyListeners();
    }
  }

  void clearOrderList(int tableId) {
    final tableIndex = _tables.indexWhere((table) => table.id == tableId);
    if (tableIndex != -1) {
      _tables[tableIndex].orderList.clear();
      _tables[tableIndex].state = TableState.available;
      notifyListeners();
    }
  }
}
