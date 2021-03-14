import 'package:qimma/Bles/Model/Responses/old/products/SingleProduct.dart';
import 'package:qimma/Bles/Model/Responses/old/profile/MyInfoResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/profile/MyOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/profile/MyWishListResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/profile/UserAddressResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class ProfileBloc extends BaseBloc {

  BehaviorSubject<MyInfoResponse> _my_info = BehaviorSubject<MyInfoResponse>();
  BehaviorSubject<MyWishListResponse> _my_wishlist = BehaviorSubject<MyWishListResponse>();
  BehaviorSubject<MyOrderResponse> _my_order = BehaviorSubject<MyOrderResponse>();
  BehaviorSubject<UserAddressResponse> _user_address = BehaviorSubject<UserAddressResponse>();

  my_info() async {
    _my_info.value = MyInfoResponse();
    _my_info.value.loading = true ;
    MyInfoResponse response = MyInfoResponse.fromMap((await repository.get(ApiRoutes.my_info())).data);
    _my_info.value = response;
    _my_info.value.loading = false ;
    updateUI();
  }

  my_wishlist() async {
    _my_wishlist.value = MyWishListResponse();
    _my_wishlist.value.loading = true ;
    MyWishListResponse response = MyWishListResponse.fromMap((await repository.get(ApiRoutes.my_wishlist())).data);
    _my_wishlist.value = response;
    _my_wishlist.value.loading = false ;
    updateUI();
  }

  my_order() async {
    _my_order.value = MyOrderResponse();
    _my_order.value.loading = true ;
    MyOrderResponse response = MyOrderResponse.fromMap((await repository.get(ApiRoutes.my_wishlist())).data);
    _my_order.value = response;
    _my_order.value.loading = false ;
    updateUI();
  }

  user_address() async {
    _user_address.value = UserAddressResponse();
    _user_address.value.loading = true ;
    UserAddressResponse response = UserAddressResponse.fromMap((await repository.get(ApiRoutes.my_wishlist())).data);
    _user_address.value = response;
    _user_address.value.loading = false;
    updateUI();
  }

  updateUI() {
    _user_address.value = _user_address.value;
    _my_order.value = _my_order.value;
    _my_wishlist.value = _my_wishlist.value;
    _my_info.value = _my_info.value;
  }

  BehaviorSubject<MyInfoResponse> get s_my_info => _my_info;
  BehaviorSubject<MyWishListResponse> get s_my_wishlist => _my_wishlist;
  BehaviorSubject<MyOrderResponse> get s_my_order => _my_order;
  BehaviorSubject<UserAddressResponse> get s_user_address => _user_address;
}

final profileBloc = ProfileBloc();