import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/old/HomeBloc.dart';
import 'package:qimma/Bles/Model/Responses/old/home/FilterWebSiteResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/home/GetMainCat.dart';
import 'package:qimma/pages/orders/orders_pointer.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_button2.dart';
import 'package:qimma/widgets/my_circle_btn.dart';
import 'package:qimma/widgets/my_loader.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    space(context),
                    MyAppBar(
                      text: AppUtils.translate(context, 'add_new_order'),
                      actions: [
                        MuCircleButton(
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<GetMainCatResponse>(
                stream: homeBloc.s_get_main_cat.stream,
                builder: (context, snapshot) {
                  if (homeBloc.s_get_main_cat.value.loading) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Loader(),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      height: size.width * .32,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              homeBloc.getProductsByCat(
                                  homeBloc.s_get_main_cat.value.data[index].id);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: size.width * .32,
                              height: size.width * .32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    homeBloc
                                        .s_get_main_cat.value.data[index].image,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                height: size.width * .08,
                                child: Center(
                                  child: Text(
                                    homeBloc
                                        .s_get_main_cat.value.data[index].name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: homeBloc.s_get_main_cat.value.data.length,
                      ),
                    );
                  }
                }),
            StreamBuilder<FilterWebSiteResponse>(
                stream: homeBloc.s_filter_website.stream,
                builder: (context, snapshot) {
                  if (homeBloc.s_filter_website.value == null ||
                      homeBloc.s_filter_website.value.loading) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Loader(),
                        SizedBox(
                          height: 60,
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Item(
                          products: homeBloc
                              .s_filter_website.value.data.products[index],
                        );
                      },
                      itemCount:
                          homeBloc.s_filter_website.value.data.products.length,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}

class Item extends StatefulWidget {
  final ProductsBean products;

  const Item({Key key, this.products}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int counter = 1;

  double price;

  @override
  void initState() {
    super.initState();

    price = double.parse(widget.products.PurchasingPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            CachedNetworkImage(imageUrl: widget.products.image),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.products.mainProductName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.products.desc,
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      MyButton2(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          if (counter > 1) {
                            counter--;
                            price = (double.parse(widget.products.PurchasingPrice) * counter);
                            setState(() {});
                          } else {
                            price = double.parse(widget.products.PurchasingPrice);
                            setState(() {});
                          }
                        },
                        width: 40,
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(counter.toString()),
                      SizedBox(
                        width: 8,
                      ),
                      MyButton2(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          counter++;
                          price = (double.parse(widget.products.PurchasingPrice) * counter);
                          setState(() {});
                        },
                        width: 40,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${price} ${AppUtils.translate(context, 'eg')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                MyButton(
                  '${AppUtils.translate(context, 'add')}',
                  onTap: () {
                    if (counter != 0) {
                      if (OrdersPointer.selectedProducts
                          .containsKey(widget.products.id)) {OrdersPointer.selectedProducts[widget.products.id] = counter;
                        // if list does not contains the item so add it
                      } else {
                        OrdersPointer.selectedProducts[widget.products.id] = counter;
                      }
                    } else {
                      OrdersPointer.selectedProducts.removeWhere((key, value) => key == widget.products.id);
                    }

                    print(OrdersPointer.selectedProducts);
                  },
                  width: 50,
                  height: 35,
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
