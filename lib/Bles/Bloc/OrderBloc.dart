import 'package:qimma/Bles/ApiRoute.dart';
import 'package:qimma/Bles/Model/Requests/AddProductTopdOrder.dart';
import 'package:qimma/Bles/Model/Requests/AddToCartRequest.dart';
import 'package:qimma/Bles/Model/Requests/AddpdOrderRequest.dart';
import 'package:qimma/Bles/Model/Responses/add_pd_order/AddpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/add_pd_order/MakeBillResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:qimma/utils/base/BaseResponse.dart';
import 'package:rxdart/rxdart.dart';

class OrderBloc extends BaseBloc {

  BehaviorSubject<AllpdOrderResponse> _all_order = BehaviorSubject<AllpdOrderResponse>();
  BehaviorSubject<SinglepdOrderResponse> _single_order = BehaviorSubject<SinglepdOrderResponse>();
  BehaviorSubject<AddpdOrderResponse> _add_order = BehaviorSubject<AddpdOrderResponse>();
  BehaviorSubject<BaseResponse> _add_product_to_order = BehaviorSubject<BaseResponse>();
  BehaviorSubject<MakeBillResponse> _make_bill = BehaviorSubject<MakeBillResponse>();

  Future<AllpdOrderResponse> allOrder() async {
    _all_order.value = AllpdOrderResponse();
    _all_order.value.loading = true ;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap((await repository.get(ApiRoutes.all_p_d_Order())).data);
    _all_order.value = response;
    _all_order.value.loading = false ;
    return response;
  }

  Future<AllpdOrderResponse> filterByDMY(int type) async {
    _all_order.value = AllpdOrderResponse();
    _all_order.value.loading = true ;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap((await repository.get(ApiRoutes.filter_P_d_orders_by_DM(type))).data);
    _all_order.value = response;
    _all_order.value.loading = false ;
    return response;
  }

  Future<AllpdOrderResponse> filterOrdersByDate(String from ,String to) async {
    _all_order.value = AllpdOrderResponse();
    _all_order.value.loading = true ;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap((await repository.get(ApiRoutes.filter_P_d_orders_by_date(from,to))).data);
    _all_order.value = response;
    _all_order.value.loading = false ;
    return response;
  }

  Future<SinglepdOrderResponse> singleOrder(int orderID) async {
    _single_order.value = SinglepdOrderResponse();
    _single_order.value.loading = true ;
    SinglepdOrderResponse response = SinglepdOrderResponse.fromMap((await repository.get(ApiRoutes.single_P_d_order(orderID))).data);
    _single_order.value = response;
    _single_order.value.loading = false ;
    return response;
  }

  /// order scenario
  // 1 -> add_P_d_order
  // 2 -> add_product_to_P_d_order
  // 3 -> make_bill

  Future<AddpdOrderResponse> addOrder(AddOrderRequest request) async {
    _add_order.value = AddpdOrderResponse();
    _add_order.value.loading = true ;
    AddpdOrderResponse response = AddpdOrderResponse.fromMap((await repository.post(ApiRoutes.add_P_d_order() , request.toJson())).data);
    _add_order.value = response;
    _add_order.value.loading = false ;
    return response;
  }

  Future<BaseResponse> addProductToOrder(AddProductTopdOrder request) async {
    _add_product_to_order.value = BaseResponse();
    _add_product_to_order.value.loading = true ;
    BaseResponse response = null ;// BaseResponse.fromMap((await repository.post(ApiRoutes.add_P_d_order() , request.toJson())).data);
    _add_product_to_order.value = response;
    _add_product_to_order.value.loading = false ;
    return response;
  }

  Future<MakeBillResponse> makeBill(
      int orderID,
      int discount_type,
      double discount,
      int tax1_type,
      int tax1,
      int tax2_type,
      int tax2,
      double paid) async {
    _make_bill.value = MakeBillResponse();
    _make_bill.value.loading = true ;
    MakeBillResponse response = MakeBillResponse.fromMap((await repository.get(ApiRoutes.make_bill(orderID, discount_type, discount, tax1_type, tax1, tax2_type, tax2, paid))).data);
    _make_bill.value = response;
    _make_bill.value.loading = false ;
    return response;
  }

  BehaviorSubject<AllpdOrderResponse> get all_orders => _all_order;
  BehaviorSubject<SinglepdOrderResponse> get s_single_P_d_order => _single_order;
}

final orderBloc = OrderBloc();