

import 'dart:developer';

import 'package:qimma/Bles/Model/Responses/old/products/ProductByCat.dart';
import 'package:qimma/Bles/Model/Responses/old/products/SingleProduct.dart';
import 'package:qimma/Bles/Model/Responses/products/AllProductsResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class ProductBloc extends BaseBloc {
  BehaviorSubject<SingleProductResponse> _get_single_product =
      BehaviorSubject<SingleProductResponse>();
  BehaviorSubject<ProductByCatResponse> _get_products_by_cat =
      BehaviorSubject<ProductByCatResponse>();

  BehaviorSubject<AllProductsResponse> _all_products_by_rating =
  BehaviorSubject<AllProductsResponse>();

  BehaviorSubject<AllProductsResponse> _all_products_without_rating =
  BehaviorSubject<AllProductsResponse>();

  BehaviorSubject<AllProductsResponse> _search_res_by_rating =
  BehaviorSubject<AllProductsResponse>();
  BehaviorSubject<AllProductsResponse> _search_res_without_ating =
  BehaviorSubject<AllProductsResponse>();

  get_single_product(int productID) async {
    _get_single_product.value = SingleProductResponse();
    _get_single_product.value.loading = true;
    SingleProductResponse response = SingleProductResponse.fromMap(
        (await repository.get(ApiRoutes.get_single_product(productID))).data);
    _get_single_product.value = response;
    _get_single_product.value.loading = false;
  }

  get_products_by_cat(int catID) async {
    _get_products_by_cat.value = ProductByCatResponse();
    _get_products_by_cat.value.loading = true;
    ProductByCatResponse response = ProductByCatResponse.fromMap(
        (await repository.get(ApiRoutes.products_by_category(catID: catID)))
            .data);
    _get_products_by_cat.value = response;
    _get_products_by_cat.value.loading = false;
  }

  Future<AllProductsResponse> getAllProductsByRating() async {
    _all_products_by_rating.value = AllProductsResponse();
    _all_products_by_rating.value.loading = true;
    AllProductsResponse response = AllProductsResponse.fromMap(
        (await repository.get(ApiRoutes.getAllProductsByRating())).data);
    _all_products_by_rating.value = response;
    _all_products_by_rating.value.loading = false;
    search_by_name2("");
    search_by_name("");
    return response;
  }

  Future<AllProductsResponse> getAllProductsWithoutRating() async {
    _all_products_without_rating.value = AllProductsResponse();
    _all_products_without_rating.value.loading = true;
    AllProductsResponse response = AllProductsResponse.fromMap(
        (await repository.get(ApiRoutes.getAllProductsWithoutRating())).data);
    _all_products_without_rating.value = response;
    _all_products_without_rating.value.loading = false;

    search_by_name2("");
    search_by_name("");
    return response;
  }

  Future<AllProductsResponse> search_by_name(String txt) async {

    _search_res_by_rating.value = AllProductsResponse();
    _search_res_by_rating.value.loading = true;

    AllProductsResponse response = await search(txt);


    _search_res_by_rating.value = response;
    _search_res_by_rating.value.loading = false;

    print("search response ------->>>> ${response.data.toString()}");
    return response;
  }
  Future<AllProductsResponse> search (String txt) async {

    AllProductsResponse data2 = AllProductsResponse();
    if(txt == "" || txt == null || txt.length == 0){
      data2 = _all_products_without_rating.value ;
      return data2;
    }
    _all_products_without_rating.value.data.forEach((element) {
      log("element -> ${element.Difference}");
      log("search txt -> ${txt}");
      if(element.Difference.toLowerCase().contains(txt.toLowerCase())){
        log("done txt -> ${txt}");
        data2.data.add(element);
      }
    });
    return data2;
  }

  Future<AllProductsResponse> search_by_name2(String txt) async {

    _search_res_without_ating.value = AllProductsResponse();
    _search_res_without_ating.value.loading = true;

    AllProductsResponse response = await search2(txt);


    _search_res_without_ating.value = response;
    _search_res_without_ating.value.loading = false;

    print("search response ------->>>> $response");
    return response;
  }
  Future<AllProductsResponse> search2 (String txt) async {
    AllProductsResponse data2 = AllProductsResponse();
    all_products_by_rating.value.data.forEach((element) {
      if(element.Difference.toLowerCase().contains(txt.toLowerCase())){
        data2.data.add(element);
      }
    });
    return data2;
  }





  BehaviorSubject<AllProductsResponse> get all_products_by_rating =>
      _all_products_by_rating;
  BehaviorSubject<AllProductsResponse> get all_products_without_rating =>
      _all_products_without_rating;

  BehaviorSubject<AllProductsResponse> get search_all_products_by_rating =>
      _search_res_by_rating;
  BehaviorSubject<AllProductsResponse> get search_all_products_without_rating =>
      _search_res_without_ating;

  BehaviorSubject<SingleProductResponse> get single_product =>
      _get_single_product;
  BehaviorSubject<ProductByCatResponse> get productsByCat =>
      _get_products_by_cat;
}

final productBloc = ProductBloc();
