import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:E_Attendance/Bles/Model/Responses/products/AllProductsResponse.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/hex_color.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';

class ProductPage extends StatefulWidget {
  final DataBean productsResponse;

  const ProductPage({Key key, this.productsResponse}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
                  text: widget.productsResponse.mainProductName.toString(),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlideshow(
                    height: 140,
                    indicatorColor: mainColor,
                    children: widget.productsResponse.images.map((e) {
                      return CachedNetworkImage(
                        imageUrl: e.toString(),
                        errorWidget: (_, __, ___) {
                          return Image.asset('assets/images/no_image.png');
                        },
                        height: 35,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${AppUtils.translate(context, 'product_page_desc')}' +
                      ' : ' +
                      '\n' +
                      widget.productsResponse.desc.toString() , style: TextStyle(fontSize: 16),),
                  Divider(),
                  Text(
                      '${AppUtils.translate(context, 'product_page_quantity')}' +
                          ' : ' +
                          widget.productsResponse.Quantity.toString(), style: TextStyle(fontSize: 16),),
                  Divider(),
                  Text('${AppUtils.translate(context, 'product_page_sizes')}' + ' : ', style: TextStyle(fontSize: 16), ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      //scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.productsResponse.sizes.length,
                      itemBuilder: (context, index) {
                        return Text(widget.productsResponse.sizes[index]['name']
                            .toString());
                      }),
                  Divider(),
                  Text('${AppUtils.translate(context, 'product_page_colors')}' + ' : ' , style: TextStyle(fontSize: 16),),
                  ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: widget.productsResponse.colors.length,
                      //scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(100, 8, 100, 0),
                          child: Container(
                            decoration: BoxDecoration(color: HexColor(widget
                                .productsResponse.colors[index]['color_code']) , borderRadius: BorderRadius.circular(30)),
                            height: 22 , width: 10, ),
                        );
                      }),
                  Divider(),
                  Text(
                      '${AppUtils.translate(context, 'product_barcode')}' +
                          ' : ' +
                          widget.productsResponse.barcode, style: TextStyle(fontSize: 16),),
                  Divider(),
                  Text(
                      '${AppUtils.translate(context, 'product_Selling_price')}' +
                          ' : ' +
                          widget.productsResponse.SellingPrice.toString(), style: TextStyle(fontSize: 16),),
                  Divider(),
                  Text(
                      '${AppUtils.translate(context, 'product_page_Wholesale_price')}' +
                          ' : ' +
                          widget.productsResponse.WholesalePrice, style: TextStyle(fontSize: 16),),
                  Divider(),
                  Text(
                      '${AppUtils.translate(context, 'product_page_Wholesale_wholesale_price')}' +
                          ' : ' +
                          widget.productsResponse.WholesaleWholesalePrice, style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
