import 'package:qimma/Bles/ApiRoute.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

class OrderBloc extends BaseBloc {

  BehaviorSubject<AllpdOrderResponse> _all_pd_order = BehaviorSubject<AllpdOrderResponse>();
  BehaviorSubject<SinglepdOrderResponse> _single_P_d_order = BehaviorSubject<SinglepdOrderResponse>();

  Future<AllpdOrderResponse> all_p_d_Order() async {
    _all_pd_order.value = AllpdOrderResponse();
    _all_pd_order.value.loading = true ;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap((await repository.get(ApiRoutes.all_p_d_Order())).data);
    _all_pd_order.value = response;
    _all_pd_order.value.loading = false ;
    return response;
  }

  Future<AllpdOrderResponse> filter_P_d_orders_by_DMY(int type) async {
    _all_pd_order.value = AllpdOrderResponse();
    _all_pd_order.value.loading = true ;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap((await repository.get(ApiRoutes.filter_P_d_orders_by_DM(type))).data);
    _all_pd_order.value = response;
    _all_pd_order.value.loading = false ;
    return response;
  }



  Future<AllpdOrderResponse> filter_P_d_orders_by_date(String from ,String to) async {
    _all_pd_order.value = AllpdOrderResponse();
    _all_pd_order.value.loading = true ;
    AllpdOrderResponse response = AllpdOrderResponse.fromMap((await repository.get(ApiRoutes.filter_P_d_orders_by_date(from,to))).data);
    _all_pd_order.value = response;
    _all_pd_order.value.loading = false ;
    return response;
  }
  Future<SinglepdOrderResponse> single_P_d_order(int orderID) async {
    _single_P_d_order.value = SinglepdOrderResponse();
    _single_P_d_order.value.loading = true ;
    SinglepdOrderResponse response = SinglepdOrderResponse.fromMap((await repository.get(ApiRoutes.single_P_d_order(orderID))).data);
    _single_P_d_order.value = response;
    _single_P_d_order.value.loading = false ;
    return response;
  }


  BehaviorSubject<AllpdOrderResponse> get s_login => _all_pd_order;
  BehaviorSubject<SinglepdOrderResponse> get s_single_P_d_order => _single_P_d_order;
}

final authBloc = OrderBloc();