import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive_app/Models/ProductsModel/productmodel.dart';

class AddProductRepo {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> Addproduct(Product product) async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      CollectionReference productref = await _firebase
          .collection("users")
          .doc(user?.uid)
          .collection("products");

      await productref.add(product.toJson());
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
