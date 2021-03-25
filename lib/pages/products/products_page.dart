import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qimma/Bles/Bloc/old/ProductsBloc.dart';
import 'package:qimma/Bles/Model/Responses/products/AllProductsResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_loader.dart';
import 'package:qimma/widgets/my_text_form_field.dart';
import 'product_page.dart';

class ShowAllProducts extends StatefulWidget {
  @override
  _ShowAllProductsState createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  bool byRatingSelected;
  String dropDownValue;
  @override
  void initState() {
    byRatingSelected = false;
    productBloc.getAllProductsWithoutRating();
    productBloc.getAllProductsByRating();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: statusBarHeight + 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
                padding: EdgeInsets.only(top: statusBarHeight),
                child: MyAppBar(
                  text:
                      "${AppUtils.translate(context, 'show_products_page_title')}",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Flexible(
                  child: MyTextFormField(
                    borderWidth: 1,
                    hintText: AppUtils.translate(context, 'search_by_name'),
                    prefixIcon: Image.asset('assets/images/search.png'),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                DropdownButton<String>(
                  style: TextStyle(color: mainColor),
                  items: <String>[
                    '${AppUtils.translate(context, 'show_products_by_rating')}',
                    '${AppUtils.translate(context, 'show_products_without_rating')}'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: mainColor,
                  ),
                  value: dropDownValue,
                  hint: Text(
                      '${AppUtils.translate(context, 'show_products_filtering')}'),
                  onChanged: (value) {
                    if (value ==
                        '${AppUtils.translate(context, 'show_products_by_rating')}') {
                      setState(() {
                        byRatingSelected = true;
                        dropDownValue =
                            '${AppUtils.translate(context, 'show_products_by_rating')}';
                      });
                    } else {
                      setState(() {
                        byRatingSelected = false;
                        dropDownValue =
                            '${AppUtils.translate(context, 'show_products_without_rating')}';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: !byRatingSelected
                  ? StreamBuilder<AllProductsResponse>(
                      stream: productBloc.all_products_by_rating.stream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (productBloc.all_products_by_rating.value.loading) {
                          return Loader();
                        } else {
                          AllProductsResponse product = snapshot.data;
                          return ListView.separated(
                            itemCount: product.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ProductPage(
                                        productsResponse: product.data[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        height: 80,
                                        width: 80,
                                        child: CachedNetworkImage(
                                          imageUrl: product.data[index].image,
                                          width: 35,
                                          errorWidget: (_, __, ___) {
                                            return Image.asset(
                                                'assets/images/no_image.png');
                                          },
                                          height: 35,
                                        ),
                                      )
                                      /*product.data[index].image==null?
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: mainColor),
                                        height: 80,
                                        width: 80,
                                      ):Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  product.data[index].image)
                                            ),),
                                        clipBehavior: Clip.hardEdge,
                                        height: 80,
                                        width: 80,
                                      )*/
                                      ,
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(product.data[index]
                                                  .mainProductName ??
                                              ''),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                              '${AppUtils.translate(context, 'show_products_quantity')}' +
                                                      ' : ' +
                                                      product
                                                          .data[index].Quantity
                                                          .toString() ??
                                                  ''),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/star.png',
                                                color: mainColor,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(product.data[index].rate.toString() ?? '')
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1.5,
                                endIndent: 5,
                                indent: 5,
                              );
                            },
                          );
                        }
                      },
                    )
                  : StreamBuilder<AllProductsResponse>(
                      stream: productBloc.all_products_without_rating.stream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (productBloc
                            .all_products_without_rating.value.loading) {
                          return Loader();
                        } else {
                          AllProductsResponse product = snapshot.data;
                          return ListView.separated(
                            itemCount: product.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ProductPage(
                                        productsResponse: product.data[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        height: 80,
                                        width: 80,
                                        child: CachedNetworkImage(
                                          imageUrl: product.data[index].image,
                                          width: 35,
                                          errorWidget: (_, __, ___) {
                                            return Image.asset(
                                                'assets/images/no_image.png');
                                          },
                                          height: 35,
                                        ),
                                      )
                                      /*
                                      product.data[index].image==null?
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: mainColor),
                                        height: 80,
                                        width: 80,
                                      ):Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  product.data[index].image)
                                          ),),
                                        clipBehavior: Clip.hardEdge,
                                        height: 80,
                                        width: 80,
                                      ),*/
                                      ,
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(product.data[index]
                                                  .mainProductName ??
                                              ''),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(product.data[index].Quantity
                                                  .toString() ??
                                              ''),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/star.png',
                                                color: mainColor,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(product.data[index].rate
                                                      .toString() ??
                                                  '')
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1.5,
                                endIndent: 5,
                                indent: 5,
                              );
                            },
                          );
                        }
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> ratingRow(int rate){
    List<Widget> widgets=[];
    for(int i = 1 ; i>rate ; i++){
      widgets.add(Image.asset(
        'assets/images/star.png',
        color: mainColor,
        height: 20,
      ));
    }
    return widgets;
  }
}
