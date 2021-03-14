import 'package:qimma/Bles/Model/Responses/old/products/ProductByCat.dart';
import 'package:qimma/Bles/Model/Responses/old/products/SingleProduct.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class ProductBloc extends BaseBloc {

  BehaviorSubject<SingleProductResponse> _get_single_product = BehaviorSubject<SingleProductResponse>();
  BehaviorSubject<ProductByCatResponse> _get_products_by_cat = BehaviorSubject<ProductByCatResponse>();

  get_single_product(int productID) async {
    _get_single_product.value = SingleProductResponse();
    _get_single_product.value.loading = true ;
    SingleProductResponse response = SingleProductResponse.fromMap((await repository.get(ApiRoutes.get_single_product(productID))).data);
    _get_single_product.value = response;
    _get_single_product.value.loading = false ;
  }

  get_products_by_cat(int catID) async {
    _get_products_by_cat.value = ProductByCatResponse();
    _get_products_by_cat.value.loading = true ;
    ProductByCatResponse response = ProductByCatResponse.fromMap((await repository.get(ApiRoutes.products_by_category(catID: catID))).data);
    _get_products_by_cat.value = response;
    _get_products_by_cat.value.loading = false ;
  }

  BehaviorSubject<SingleProductResponse> get single_product => _get_single_product;
  BehaviorSubject<ProductByCatResponse> get productsByCat => _get_products_by_cat;

}

final productBloc = ProductBloc();