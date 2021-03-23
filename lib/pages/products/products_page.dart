import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/old/ProductsBloc.dart';
import 'package:qimma/Bles/Model/Responses/products/AllProductsResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_loader.dart';

class ShowAllProducts extends StatefulWidget {
  @override
  _ShowAllProductsState createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  bool byRatingSelected;

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
    String dropDownValue =
        '${AppUtils.translate(context, 'show_products_without_rating')}';
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
            child: DropdownButton<String>(
              style: TextStyle(
                color: mainColor
              ),
              items: <String>[
                '${AppUtils.translate(context, 'show_products_by_rating')}',
                '${AppUtils.translate(context, 'show_products_without_rating')}'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              icon: Icon(Icons.filter_alt_outlined , color: mainColor,),
              value: dropDownValue,
              onChanged: (value) {
                setState(() {
                  dropDownValue = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: byRatingSelected
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
                              return Container(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: mainColor),
                                      height: 80,
                                      width: 80,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        Text(product
                                                .data[index].mainProductName ??
                                            ''),
                                        Text(product.data[index].Quantity
                                                .toString() ??
                                            ''),
                                      ],
                                    ),
                                  ],
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
                              return Container(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: mainColor),
                                      height: 80,
                                      width: 80,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        Text(product
                                                .data[index].mainProductName ??
                                            ''),
                                        Text(product.data[index].Quantity
                                                .toString() ??
                                            ''),
                                      ],
                                    ),
                                  ],
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
}
