
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:qimma/Bles/Model/Responses/old/home/FilterWebSiteResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/home/GetMainCat.dart';
import 'package:qimma/Bles/Model/Responses/old/home/HomeResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/home/SearchByNameResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class HomeBloc extends BaseBloc {

  BehaviorSubject<GetMainCatResponse> _get_main_cat = BehaviorSubject<GetMainCatResponse>();
  BehaviorSubject<FilterWebSiteResponse> _filter_website = BehaviorSubject<FilterWebSiteResponse>();
  BehaviorSubject<SearchByNameResponse> _search_by_name = BehaviorSubject<SearchByNameResponse>();
  BehaviorSubject<HomeResponse> _home = BehaviorSubject<HomeResponse>();

  get_main_cat() async {
    _get_main_cat.value = GetMainCatResponse();
    _get_main_cat.value.loading = true ;
    GetMainCatResponse response = GetMainCatResponse.fromMap((await repository.get(ApiRoutes.get_main_cat())).data);
    _get_main_cat.value = response;
    _get_main_cat.value.loading = false ;

  }

  filter_website(int cat_id) async {
    _filter_website.value = FilterWebSiteResponse();
    _filter_website.value.loading = true ;
    FilterWebSiteResponse response = FilterWebSiteResponse.fromMap((await repository.get(ApiRoutes.filter_website(cat_id))).data);
    _filter_website.value = response;
    _filter_website.value.loading = false ;
  }

  search_by_name(String name) async {
    _search_by_name.value = SearchByNameResponse();
    _search_by_name.value.loading = true ;
    SearchByNameResponse response = SearchByNameResponse.fromMap((await repository.get(ApiRoutes.search_by_name(name))).data);
    _search_by_name.value = response;
    _search_by_name.value.loading = false ;
  }

  filter({String from = "0" , String to = "20" , String type = "2" , String cat_id = "1"}) async {
    _home.value = HomeResponse();
    _home.value.loading = true ;
    HomeResponse response = HomeResponse.fromMap((await repository.get(ApiRoutes.filter(from, to, type))).data);
    _home.value = response;
    _home.value.loading = false ;
  }

  getHome() async {
    _home.value = HomeResponse();
    _home.value.loading = true ;
    HomeResponse response = HomeResponse.fromMap(await (await repository.get(ApiRoutes.home())).data);
    _home.value = response;
    _home.value.loading = false ;
  }

  BehaviorSubject<GetMainCatResponse> get s_get_main_cat => _get_main_cat;
  BehaviorSubject<FilterWebSiteResponse> get s_filter_website => _filter_website;
  BehaviorSubject<SearchByNameResponse> get s_search_by_name =>  _search_by_name;
  BehaviorSubject<HomeResponse> get s_home => _home ;
}

final homeBloc = HomeBloc();
