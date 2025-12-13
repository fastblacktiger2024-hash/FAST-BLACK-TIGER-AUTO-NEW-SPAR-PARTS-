import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/firestore_service.dart';

class ProductProvider extends ChangeNotifier {
  final FirestoreService _service = FirestoreService();
  List<Product> _products = [];
  bool _loading = false;

  List<Product> get products => _products;
  bool get loading => _loading;

  Future<void> fetchProducts() async {
    _loading = true;
    notifyListeners();
    try {
      final list = await _service.getProducts();
      _products = list.map((m) => Product.fromMap(m['id'], m)).toList();
    } catch (e) {
      // handle error silently for now
      _products = [];
    }
    _loading = false;
    notifyListeners();
  }

  Product? findById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> addProduct(Product product) async {
    await _service.addProduct(product.toMap());
    await fetchProducts();
  }

  Future<void> updateProduct(Product product) async {
    await _service.updateProduct(product.id, product.toMap());
    await fetchProducts();
  }

  Future<void> deleteProduct(String id) async {
    await _service.deleteProduct(id);
    await fetchProducts();
  }
}
