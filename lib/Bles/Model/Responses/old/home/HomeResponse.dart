import 'package:E_Attendance/Bles/Model/Responses/old/home/FilterWebSiteResponse.dart';
import 'package:E_Attendance/utils/base/BaseResponse.dart';

class HomeResponse extends BaseResponse {
  HomeProductItem data;
  int status;
  String message;

  static HomeResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    HomeResponse homeResponseBean = HomeResponse();
    homeResponseBean.data = HomeProductItem.fromMap(map['data']);
    homeResponseBean.status = map['status'];
    homeResponseBean.message = map['message'];
    return homeResponseBean;
  }

  Map toJson() => {
    "data": data,
    "status": status,
    "message": message,
  };
}

class HomeProductItem {
  List<ProductsBean> highRated;
  List<ProductsBean> Offers;
  List<ProductsBean> bestSeller;
  List<SlidersBean> sliders;

  static HomeProductItem fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    HomeProductItem dataBean = HomeProductItem();
    dataBean.highRated = List()..addAll((map['high_rated'] as List ?? []).map((o) => ProductsBean.fromMap(o)));
    dataBean.Offers = List()..addAll((map['Offers'] as List ?? []).map((o) => ProductsBean.fromMap(o)));
    dataBean.bestSeller = List()..addAll((map['best_seller'] as List ?? []).map((o) => ProductsBean.fromMap(o)));
    dataBean.sliders = List()..addAll((map['sliders'] as List ?? []).map((o) => SlidersBean.fromMap(o)));
    return dataBean;
  }

  Map toJson() => {
    "high_rated": highRated,
    "Offers": Offers,
    "best_seller": bestSeller,
    "sliders": sliders,
  };
}

class SlidersBean {
  int id;
  String image;
  dynamic titleAr;
  dynamic titleEn;
  dynamic subTitleAr;
  dynamic subTitleEn;
  dynamic btnTextAr;
  dynamic btnTextEn;
  dynamic btnLink;

  static SlidersBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SlidersBean slidersBean = SlidersBean();
    slidersBean.id = map['id'];
    slidersBean.image = map['image'];
    slidersBean.titleAr = map['title_ar'];
    slidersBean.titleEn = map['title_en'];
    slidersBean.subTitleAr = map['sub_title_ar'];
    slidersBean.subTitleEn = map['sub_title_en'];
    slidersBean.btnTextAr = map['btn_text_ar'];
    slidersBean.btnTextEn = map['btn_text_en'];
    slidersBean.btnLink = map['btn_link'];
    return slidersBean;
  }

  Map toJson() => {
    "id": id,
    "image": image,
    "title_ar": titleAr,
    "title_en": titleEn,
    "sub_title_ar": subTitleAr,
    "sub_title_en": subTitleEn,
    "btn_text_ar": btnTextAr,
    "btn_text_en": btnTextEn,
    "btn_link": btnLink,
  };
}