import 'dart:developer';

import 'package:qimma/Bles/ApiRoute.dart';
import 'package:qimma/Bles/Model/Requests/AddProductTopdOrder.dart';
import 'package:qimma/Bles/Model/Requests/AddToCartRequest.dart';
import 'package:qimma/Bles/Model/Requests/AddpdOrderRequest.dart';
import 'package:qimma/Bles/Model/Requests/EditStatusRequest.dart';
import 'package:qimma/Bles/Model/Responses/add_pd_order/AddProductsToPDOrder.dart';
import 'package:qimma/Bles/Model/Responses/add_pd_order/AddpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/add_pd_order/MakeBillResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/AllProductsResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/AllUsersResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/EditStatusResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/FinishedOrdersResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:qimma/utils/base/BaseResponse.dart';
import 'package:rxdart/rxdart.dart';

class OrderBloc extends BaseBloc {
  BehaviorSubject<AllpdOrderResponse> _all_order =
      BehaviorSubject<AllpdOrderResponse>();
  BehaviorSubject<SinglepdOrderResponse> _single_order =
      BehaviorSubject<SinglepdOrderResponse>();
  BehaviorSubject<AddpdOrderResponse> add_order =
      BehaviorSubject<AddpdOrderResponse>();
  BehaviorSubject<AllpdOrderResponse> _finished_orders =
  BehaviorSubject<AllpdOrderResponse>();
  BehaviorSubject<AddProductsToPDOrder> _add_product_to_order =
      BehaviorSubject<AddProductsToPDOrder>();
  BehaviorSubject<AllUsersResponse> _allUsers =
      BehaviorSubject<AllUsersResponse>();
  BehaviorSubject<AllProductsResponse> _allProducts =
      BehaviorSubject<AllProductsResponse>();
  BehaviorSubject<AllProductsResponse> _search_products =
      BehaviorSubject<AllProductsResponse>();
  BehaviorSubject<MakeBillResponse> _make_bill =
      BehaviorSubject<MakeBillResponse>();
  BehaviorSubject<double> amount = BehaviorSubject<double>();
  BehaviorSubject<EditStatusResponse>
  _edit_status =
  BehaviorSubject<EditStatusResponse>();

  Future<AllpdOrderResponse> allOrder() async {
    _all_order.value = AllpdOrderResponse();
    _all_order.value.loading = true;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap(
        (await repository.get(ApiRoutes.all_p_d_Order())).data);
    _all_order.value = response;
    _all_order.value.loading = false;
    return _all_order.value;
  }

  Future<AllpdOrderResponse> getFinishedOrders() async {
    _finished_orders.value = AllpdOrderResponse();
    _finished_orders.value.loading = true;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap(
        (await repository.get(ApiRoutes.finishedOrders())).data);
    _finished_orders.value = response;
    _finished_orders.value.loading = false;
    return response;
  }

  Future<AllpdOrderResponse> filterByDMY(int type) async {
    _all_order.value = AllpdOrderResponse();
    _all_order.value.loading = true;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap(
        (await repository.get(ApiRoutes.filter_P_d_orders_by_DM(type))).data);
    _all_order.value = response;
    _all_order.value.loading = false;
    return response;
  }

  Future<AllpdOrderResponse> filterOrdersByDate(String from, String to) async {
    _all_order.value = AllpdOrderResponse();
    _all_order.value.loading = true;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap(
        (await repository.get(ApiRoutes.filter_P_d_orders_by_date(from, to)))
            .data);
    _all_order.value = response;
    _all_order.value.loading = false;
    return response;
  }

  Future<SinglepdOrderResponse> singleOrder(int orderID) async {
    _single_order.value = SinglepdOrderResponse();
    _single_order.value.loading = true;
    SinglepdOrderResponse response = SinglepdOrderResponse.fromMap(
        (await repository.get(ApiRoutes.single_P_d_order(orderID))).data);
    _single_order.value = response;
    _single_order.value.loading = false;
    return response;
  }

  /// order scenario
  // 1 -> add_P_d_order
  // 2 -> add_product_to_P_d_order
  // 3 -> make_bill

  Future<AddpdOrderResponse> addOrder(AddOrderRequest request) async {

    _add_product_to_order.value = AddProductsToPDOrder();

    add_order.value = AddpdOrderResponse();
    add_order.value.loading = true;
    AddpdOrderResponse response = AddpdOrderResponse.fromMap(
        (await repository.post(ApiRoutes.add_P_d_order(), request.toJson()))
            .data);
    add_order.value = response;
    add_order.value.loading = false;



    return response;
  }

  Future<AddProductsToPDOrder> addProductToOrder(dynamic orderId, AddProductTopdOrder request) async {
    _add_product_to_order.value = AddProductsToPDOrder();
    _add_product_to_order.value.loading = true ;
    AddProductsToPDOrder response = AddProductsToPDOrder.fromMap( (await repository.post(
            ApiRoutes.add_product_to_P_d_order(orderId), request.toJson()))
        .data);
    _add_product_to_order.value = response ;
    _add_product_to_order.value.loading = false;
    return response;
  }

  Future<AllUsersResponse> getAllUsers() async {
    _allUsers.value = AllUsersResponse();
    _allUsers.value.loading = true;
    _allUsers.value = AllUsersResponse.fromJson(
        (await repository.get(ApiRoutes.getAllUsers())).data);
    _allUsers.value.loading = false;
    return _allUsers.value;
  }

  Future<AllProductsResponse> getAllProducts() async {
    _allProducts.value = AllProductsResponse();
    _allProducts.value.loading = true;
    _allProducts.value = AllProductsResponse.fromJson(
        (await repository.get(ApiRoutes.getAllProducts())).data);
    _allProducts.value.loading = false;
    await search_by_name("");
    return _allProducts.value;
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
    _make_bill.value.loading = true;
    MakeBillResponse response = MakeBillResponse.fromMap((await repository.get(
            ApiRoutes.make_bill(orderID, discount_type, discount, tax1_type,
                tax1, tax2_type, tax2, paid)))
        .data);
    _make_bill.value = response;
    _make_bill.value.loading = false;
    return response;
  }

  Future<EditStatusResponse> editStatus(
      EditStatusRequest request , int orderID) async {
    _edit_status.value = EditStatusResponse();
    _edit_status.value.loading = true;
    EditStatusResponse response =
    EditStatusResponse.fromMap((await repository.post(
        ApiRoutes.editStatus(orderID), request.toJson()))
        .data);
    _edit_status.value = response;
    _edit_status.value.loading = false;
    return response;
  }
  Future<SinglepdOrderResponse> editOrder(
      Order_AllPD request) async {
    // _single_order.value.loading = true;
    // SinglepdOrderResponse response = SinglepdOrderResponse.fromMap((await repository.postObject(
    //     ApiRoutes.editOrder(orderID: request.id), request))
    //     .data);
    // _single_order.value = response;

    (await repository.postObject(
            ApiRoutes.editOrder(orderID: request.id), request));
    return null;
  }
  Future<AllProductsResponse> search_by_name(String txt) async {

    _search_products.value = AllProductsResponse();
    _search_products.value.loading = true;

    AllProductsResponse response = await search(txt);


    _search_products.value = response;
    _search_products.value.loading = false;

    print("search response ------->>>> ${response.data.toString()}");
    return response;
  }
  Future<AllProductsResponse> search (String txt) async {

    AllProductsResponse data2 = AllProductsResponse();
    data2.data = List<Products>();
    data2.loading = true;
    if(txt == "" || txt == null || txt.length == 0){
      data2 = all_products.value ;
      data2.loading = false;
      return data2;
    }
    all_products.value.data.forEach((element) {
      log("element -> ${element.difference}");
      log("search txt -> ${txt}");
      if(element.difference.toLowerCase().contains(txt.toLowerCase())){
        log("done txt -> ${txt}");
        data2.data.add(element);
      }
    });
    data2.loading = false;
    return data2;
  }



  BehaviorSubject<AllpdOrderResponse> get all_orders => _all_order;
  BehaviorSubject<AllpdOrderResponse> get finished_orders => _finished_orders;
  BehaviorSubject<AllUsersResponse> get all_users => _allUsers;
  BehaviorSubject<AllProductsResponse> get all_products => _allProducts;
  BehaviorSubject<AllProductsResponse> get search_products => _search_products;
  BehaviorSubject<SinglepdOrderResponse> get s_single_P_d_order =>
      _single_order;
  BehaviorSubject<EditStatusResponse>
  get edit_status => _edit_status;

  BehaviorSubject<AddProductsToPDOrder> get add_product_to_order => _add_product_to_order;
}

final orderBloc = OrderBloc();
