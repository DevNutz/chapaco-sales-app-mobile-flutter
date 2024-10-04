import 'package:flutter/foundation.dart';
import 'package:chapacosales/models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(id: 1, name: "Cerveza Babaria 1.3L", price: 25.00),
    Product(id: 2, name: "Cerveza Huari 750ML", price: 25.00),
    Product(id: 3, name: "Cerveza Potosina 1L", price: 25.00),
    Product(id: 4, name: "Cerveza Burguesa Lata 375ML", price: 25.00),
    Product(id: 5, name: "Yarda Aracoiris", price: 80.00),
    Product(id: 6, name: "Hamburguesa", price: 30.00),
    Product(id: 7, name: "Jarra Fernet Branca", price: 55.00),
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(int id, Product updatedProduct) {
    final index = _products.indexWhere((product) => product.id == id);
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(int id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  Product? getProductById(int id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
