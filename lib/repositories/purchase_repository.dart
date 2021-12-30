import 'package:application/models/models.dart';
import 'package:application/repositories/repository.dart';
import 'package:built_value/serializer.dart';

mixin PurchaseRepositoryMixin on BaseRepository {
  Future<List<AppProduct?>> products() => purchaseApi
      .fetchProducts(type: 'one')
      .then((List<Map<String, dynamic>> list) =>
          list.map((Map<String, dynamic> item) {
            try {
              return AppProduct.fromMap(item);
            } on DeserializationError catch (e) {
              l.info(this, 'products: deserialization fail: ${e.error}');
              rethrow;
            }
          }).toList());

  Future<List<AppProduct?>> memberships() => purchaseApi
      .fetchProducts(type: 'sub')
      .then((List<Map<String, dynamic>> list) =>
          list.map((Map<String, dynamic> item) {
            try {
              return AppProduct.fromMap(item);
            } on DeserializationError catch (e) {
              l.info(this, 'products: deserialization fail: ${e.error}');
              rethrow;
            }
          }).toList());

  Future<AppProduct?> membership(String sku) async {
    List<AppProduct?> _memberships = await memberships();
    List<AppProduct?> _s = _memberships.where((e) => e!.id == sku).toList();
    if (_s.isNotEmpty) {
      return _s.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> verifyReceipt(Map<String, String?> body) =>
      purchaseApi
          .verifyReceipt(body)
          .then((List<Map<String, dynamic>> response) => response);

  Future<void> syncUser(String? token) => purchaseApi.syncUser(token);
  Future<void> checkMembership(String? token, String? purchaseId) {
    return purchaseApi.checkMembership(token, purchaseId);
  }

  Future<void> testAddStar(String? token, int star) =>
      purchaseApi.testAddStar(token, star);

  Future<void> testUpdateMembership(String? token, String membership) =>
      purchaseApi.testUpdateMembership(token, membership);
}
