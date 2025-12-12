import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference get productsRef => _db.collection('products');

  Future<List<Map<String, dynamic>>> getProducts() async {
    final snap = await productsRef.get();
    return snap.docs.map((d) {
      final m = d.data() as Map<String, dynamic>;
      m['id'] = d.id;
      return m;
    }).toList();
  }

  Future<String> uploadImage(Uint8List data, String path) async {
    final ref = _storage.ref().child(path);
    final task = await ref.putData(data);
    return await task.ref.getDownloadURL();
  }

  Future<void> addProduct(Map<String, dynamic> product) async {
    await productsRef.add(product);
  }

  Future<void> updateProduct(String id, Map<String, dynamic> data) async {
    await productsRef.doc(id).update(data);
  }

  Future<void> deleteProduct(String id) async {
    await productsRef.doc(id).delete();
  }
}
