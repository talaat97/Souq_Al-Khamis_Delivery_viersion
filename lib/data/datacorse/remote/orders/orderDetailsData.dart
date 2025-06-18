import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getData(orderId) async {
    var response =
        await crud.postData(Applink.detailseOrder, {'orderId': orderId});

    return response.fold((l) => l, (r) => r);
  }
}
