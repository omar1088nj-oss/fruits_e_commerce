import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_e_commerce/core/services/datebase_service.dart';

class FirestoreService extends DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await _firestore.collection(path).doc(documentId).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var result = await _firestore.collection(path).doc(documentId).get();

    return result.data() ?? {};
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await _firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
