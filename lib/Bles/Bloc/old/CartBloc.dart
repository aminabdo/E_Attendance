
import 'package:qimma/Bles/Model/Requests/AddToCartRequest.dart';
import 'package:qimma/Bles/Model/Requests/UpdateCartRequest.dart';
import 'package:qimma/Bles/Model/Responses/old/cart/AddToCartResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/cart/CartDeleteResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/cart/CountOfCartResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/cart/MyCartResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/cart/UpdateCartResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class CartBloc extends BaseBloc {
  BehaviorSubject<AddToCartResponse> _add_to_cart = BehaviorSubject<AddToCartResponse>();
  BehaviorSubject<MyCartResponse> _my_cart = BehaviorSubject<MyCartResponse>();
  BehaviorSubject<CountOfCartResponse> _count_of_cart = BehaviorSubject<CountOfCartResponse>();
  BehaviorSubject<CartDeleteResponse> _delete_from_cart = BehaviorSubject<CartDeleteResponse>();
  BehaviorSubject<UpdateCartResponse> _update_cart = BehaviorSubject<UpdateCartResponse>();

  addToCart(AddToCartRequest request) async {
    _add_to_cart.value = AddToCartResponse();
    _add_to_cart.value.loading = true ;
    AddToCartResponse response = AddToCartResponse.fromMap((await repository.post(ApiRoutes.add_to_cart(request.productId),request.toJson())).data);
    _add_to_cart.value = response;
    _add_to_cart.value.loading = false ;
  }

  Future<void> getMyCart() async {
    _my_cart.value = MyCartResponse();
    _my_cart.value.loading = true ;
    MyCartResponse response = MyCartResponse.fromMap((await repository.get(ApiRoutes.my_cart())).data);
    _my_cart.value = response;
    _my_cart.value.loading = false ;
  }

  countOfCart() async {
    _count_of_cart.value = CountOfCartResponse();
    _count_of_cart.value.loading = true ;
    CountOfCartResponse response = CountOfCartResponse.fromMap((await repository.get(ApiRoutes.count_of_cart())).data);
    _count_of_cart.value = response;
    _count_of_cart.value.loading = false ;
  }

  deleteFromCart(int productID) async {
    _delete_from_cart.value = CartDeleteResponse();
    _delete_from_cart.value.loading = true ;
    CartDeleteResponse response = CartDeleteResponse.fromMap((await repository.post(ApiRoutes.delete_from_cart(productID) , null)).data);
    _delete_from_cart.value = response;
    _delete_from_cart.value.loading = false ;
  }

  updateCart(UpdateCartRequest request) async {
    _update_cart.value = UpdateCartResponse();
    _update_cart.value.loading = true ;
    UpdateCartResponse response = UpdateCartResponse.fromMap(
        (await repository.post(ApiRoutes.update_cart() , request.toJson())).data);
    _update_cart.value = response;
    _update_cart.value.loading = false ;
  }

  BehaviorSubject<AddToCartResponse> get add_to_cart => _add_to_cart;
  BehaviorSubject<MyCartResponse> get my_cart => _my_cart;
  BehaviorSubject<CountOfCartResponse> get count_of_cart => _count_of_cart;
  BehaviorSubject<CartDeleteResponse> get delete_from_cart => _delete_from_cart;
  BehaviorSubject<UpdateCartResponse> get update_cart => _update_cart;

}

final cartBloc = CartBloc();