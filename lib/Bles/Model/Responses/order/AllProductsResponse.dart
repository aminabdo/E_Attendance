import 'package:qimma/utils/base/BaseResponse.dart';

class AllProductsResponse extends BaseResponse{
  int _status;
  List<Products> _data;
  String _message;

  AllProductsResponse({int status, List<Products> data, String message}) {
    this._status = status;
    this._data = data;
    this._message = message;
  }

  int get status => _status;
  set status(int status) => _status = status;
  List<Products> get data => _data;
  set data(List<Products> data) => _data = data;
  String get message => _message;
  set message(String message) => _message = message;

  AllProductsResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = new List<Products>();
      json['data'].forEach((v) {
        _data.add(new Products.fromJson(v));
      });
    }
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    return data;
  }
}

class Products {
  int _id;
  String _mainProductId;
  String _mainProductName;
  String _desc;
  String _difference;
  String _image;
  int _rate;
  int _isOffer;
  String _offerAmount;
  double _lat;
  double _lng;
  String _distance;
  bool _isFavorite;
  int _inventoryId;
  String _inventoryName;
  dynamic _quantity;
  List<Colors> _colors;
  List<Sizes> _sizes;
  List<Images> _images;
  String _purchasingPrice;
  String _wholesaleWholesalePrice;
  String _wholesalePrice;
  String _sellingPrice;
  String _barcode;

  Products(
      {int id,
        String mainProductId,
        String mainProductName,
        String desc,
        String difference,
        String image,
        int rate,
        int isOffer,
        String offerAmount,
        double lat,
        double lng,
        String distance,
        bool isFavorite,
        int inventoryId,
        String inventoryName,
        String quantity,
        List<Colors> colors,
        List<Sizes> sizes,
        List<Images> images,
        String purchasingPrice,
        String wholesaleWholesalePrice,
        String wholesalePrice,
        String sellingPrice,
        String barcode}) {
    this._id = id;
    this._mainProductId = mainProductId;
    this._mainProductName = mainProductName;
    this._desc = desc;
    this._difference = difference;
    this._image = image;
    this._rate = rate;
    this._isOffer = isOffer;
    this._offerAmount = offerAmount;
    this._lat = lat;
    this._lng = lng;
    this._distance = distance;
    this._isFavorite = isFavorite;
    this._inventoryId = inventoryId;
    this._inventoryName = inventoryName;
    this._quantity = quantity;
    this._colors = colors;
    this._sizes = sizes;
    this._images = images;
    this._purchasingPrice = purchasingPrice;
    this._wholesaleWholesalePrice = wholesaleWholesalePrice;
    this._wholesalePrice = wholesalePrice;
    this._sellingPrice = sellingPrice;
    this._barcode = barcode;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get mainProductId => _mainProductId;
  set mainProductId(String mainProductId) => _mainProductId = mainProductId;
  String get mainProductName => _mainProductName;
  set mainProductName(String mainProductName) =>
      _mainProductName = mainProductName;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get difference => _difference;
  set difference(String difference) => _difference = difference;
  String get image => _image;
  set image(String image) => _image = image;
  int get rate => _rate;
  set rate(int rate) => _rate = rate;
  int get isOffer => _isOffer;
  set isOffer(int isOffer) => _isOffer = isOffer;
  String get offerAmount => _offerAmount;
  set offerAmount(String offerAmount) => _offerAmount = offerAmount;
  double get lat => _lat;
  set lat(double lat) => _lat = lat;
  double get lng => _lng;
  set lng(double lng) => _lng = lng;
  String get distance => _distance;
  set distance(String distance) => _distance = distance;
  bool get isFavorite => _isFavorite;
  set isFavorite(bool isFavorite) => _isFavorite = isFavorite;
  int get inventoryId => _inventoryId;
  set inventoryId(int inventoryId) => _inventoryId = inventoryId;
  String get inventoryName => _inventoryName;
  set inventoryName(String inventoryName) => _inventoryName = inventoryName;
  String get quantity => _quantity;
  set quantity(String quantity) => _quantity = quantity;
  List<Colors> get colors => _colors;
  set colors(List<Colors> colors) => _colors = colors;
  List<Sizes> get sizes => _sizes;
  set sizes(List<Sizes> sizes) => _sizes = sizes;
  List<Images> get images => _images;
  set images(List<Images> images) => _images = images;
  String get purchasingPrice => _purchasingPrice;
  set purchasingPrice(String purchasingPrice) =>
      _purchasingPrice = purchasingPrice;
  String get wholesaleWholesalePrice => _wholesaleWholesalePrice;
  set wholesaleWholesalePrice(String wholesaleWholesalePrice) =>
      _wholesaleWholesalePrice = wholesaleWholesalePrice;
  String get wholesalePrice => _wholesalePrice;
  set wholesalePrice(String wholesalePrice) => _wholesalePrice = wholesalePrice;
  String get sellingPrice => _sellingPrice;
  set sellingPrice(String sellingPrice) => _sellingPrice = sellingPrice;
  String get barcode => _barcode;
  set barcode(String barcode) => _barcode = barcode;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _mainProductId = json['main_product_id'];
    _mainProductName = json['main_Product_name'];
    _desc = json['desc'];
    _difference = json['Difference'];
    _image = json['image'];
    _rate = json['rate'];
    _isOffer = json['is_offer'];
    _offerAmount = json['offer_amount'];
    _lat = json['lat'];
    _lng = json['lng'];
    _distance = json['distance'];
    _isFavorite = json['is_favorite'];
    _inventoryId = json['Inventory_id'];
    _inventoryName = json['Inventory_name'];
    _quantity = json['Quantity'];
    if (json['colors'] != null) {
      _colors = new List<Colors>();
      json['colors'].forEach((v) {
        _colors.add(new Colors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      _sizes = new List<Sizes>();
      json['sizes'].forEach((v) {
        _sizes.add(new Sizes.fromJson(v));
      });
    }
    if (json['images'] != null) {
      _images = new List<Images>();
      json['images'].forEach((v) {
        _images.add(new Images.fromJson(v));
      });
    }
    _purchasingPrice = json['Purchasing_price'];
    _wholesaleWholesalePrice = json['Wholesale_wholesale_price'];
    _wholesalePrice = json['Wholesale_price'];
    _sellingPrice = json['Selling_price'];
    _barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['main_product_id'] = this._mainProductId;
    data['main_Product_name'] = this._mainProductName;
    data['desc'] = this._desc;
    data['Difference'] = this._difference;
    data['image'] = this._image;
    data['rate'] = this._rate;
    data['is_offer'] = this._isOffer;
    data['offer_amount'] = this._offerAmount;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    data['distance'] = this._distance;
    data['is_favorite'] = this._isFavorite;
    data['Inventory_id'] = this._inventoryId;
    data['Inventory_name'] = this._inventoryName;
    data['Quantity'] = this._quantity;
    if (this._colors != null) {
      data['colors'] = this._colors.map((v) => v.toJson()).toList();
    }
    if (this._sizes != null) {
      data['sizes'] = this._sizes.map((v) => v.toJson()).toList();
    }
    if (this._images != null) {
      data['images'] = this._images.map((v) => v.toJson()).toList();
    }
    data['Purchasing_price'] = this._purchasingPrice;
    data['Wholesale_wholesale_price'] = this._wholesaleWholesalePrice;
    data['Wholesale_price'] = this._wholesalePrice;
    data['Selling_price'] = this._sellingPrice;
    data['barcode'] = this._barcode;
    return data;
  }
}

class Colors {
  int _id;
  String _colorCode;

  Colors({int id, String colorCode}) {
    this._id = id;
    this._colorCode = colorCode;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get colorCode => _colorCode;
  set colorCode(String colorCode) => _colorCode = colorCode;

  Colors.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['color_code'] = this._colorCode;
    return data;
  }
}

class Sizes {
  int _id;
  String _name;

  Sizes({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Sizes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class Images {
  int _id;
  String _image;

  Images({int id, String image}) {
    this._id = id;
    this._image = image;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get image => _image;
  set image(String image) => _image = image;

  Images.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image'] = this._image;
    return data;
  }
}