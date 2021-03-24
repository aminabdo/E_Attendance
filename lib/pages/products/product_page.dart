import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:qimma/Bles/Model/Responses/products/AllProductsResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
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
                  text:
                  widget.productsResponse.mainProductName.toString(),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ImageSlideshow(
                    height: 120,
                    indicatorColor: mainColor,
                    children: widget.productsResponse.images.map((e){
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(e.toString())
                          ),),
                        clipBehavior: Clip.hardEdge,
                      );
                    }).toList(),
                  ),
                  Text(widget.productsResponse.Quantity.toString()),
                  Text(widget.productsResponse.mainProductId.toString()),
                  Text("Sizes : "),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: widget.productsResponse.sizes.length,
                      itemBuilder: (context , index){
                        return Text(widget.productsResponse.sizes[index]['name'].toString());
                      }),
                  Text("Colors : "),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.productsResponse.colors.length,
                      itemBuilder: (context , index){
                        return Text(widget.productsResponse.colors[index]['color_code'].toString());
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
