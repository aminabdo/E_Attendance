import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/Bles/Model/Requests/AddProductTopdOrder.dart';
import 'package:qimma/Bles/Model/Responses/order/AllProductsResponse.dart';
import 'package:qimma/pages/orders/orders_pointer.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_button2.dart';
import 'package:qimma/widgets/my_loader.dart';

import 'bill_page.dart';

class ProductsPage extends StatefulWidget {
  final dynamic orderId;

  const ProductsPage({Key key, @required this.orderId}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool isLoading = false;

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: Loader(),
      color: mat.Colors.white,
      opacity: .5,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(18.0),
          child: MyButton2(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppUtils.translate(context, 'next'),
                  style: TextStyle(color: mat.Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  OrdersPointer.selectedProducts.isEmpty
                      ? ''
                      : '(${AppUtils.translate(context, 'items')}  ${OrdersPointer.selectedProducts.length})',
                  style: TextStyle(color: mat.Colors.white),
                )
              ],
            ),
            btnColor: OrdersPointer.selectedProducts.isEmpty ? mat.Colors.grey : mainColor,
            onTap: OrdersPointer.selectedProducts.isEmpty
                ? null
                : () async {
                    setState(() {
                      isLoading = true;
                    });

                    var request = AddProductTopdOrder(orders: OrdersPointer.selectedProducts);
                    print(request);

                    var response = await orderBloc.addProductToOrder(widget.orderId, request);
                    if(response['status'] == 0) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => BillPage(orderId: widget.orderId,)));
                      AppUtils.showToast(msg: AppUtils.translate(context, 'done'));
                    } else {
                      AppUtils.showToast(msg: response.message);
                    }
                  },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                color: mat.Colors.white,
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
                      ),
                      StreamBuilder<AllProductsResponse>(
                        stream: orderBloc.all_products.stream,
                        builder: (context, snapshot) {
                          if (orderBloc.all_products.value.loading) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: size.width / 2,
                                ),
                                Loader(),
                                SizedBox(
                                  height: size.width / 2,
                                ),
                              ],
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ProductItem(
                                  product:
                                      orderBloc.all_products.value.data[index],
                                  onCounterChange: () {
                                    setState(() {});
                                  },
                                );
                              },
                              itemCount:
                                  orderBloc.all_products.value.data.length,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Products product;
  final Function() onCounterChange;

  const ProductItem({Key key, this.product, this.onCounterChange})
      : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int selectedColor = 0;
  int selectedSize = 0;

  int counter = 1;

  double price;

  @override
  void initState() {
    super.initState();

    price = double.parse(widget.product.purchasingPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text(widget.product.mainProductName)),
                  Flexible(
                    child: Text('$price ${AppUtils.translate(context, 'eg')}'),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(AppUtils.translate(context, 'colors')),
              SizedBox(
                height: 10,
              ),
              widget.product.colors.isEmpty
                  ? Text(
                      AppUtils.translate(
                        context,
                        'no_colors_available',
                      ),
                      style: TextStyle(fontSize: 12, color: mat.Colors.grey),
                    )
                  : Wrap(
                      children: List.generate(
                        widget.product.sizes.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            duration: Duration(milliseconds: 250),
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(int.parse(
                                  '0xff${widget.product.colors[index].colorCode}')),
                              child: index == selectedColor
                                  ? Icon(
                                      Icons.check,
                                      size: 12,
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
              SizedBox(
                height: 25,
              ),
              Text(AppUtils.translate(context, 'sizes')),
              SizedBox(
                height: 5,
              ),
              widget.product.sizes.isEmpty
                  ? Text(
                      AppUtils.translate(
                        context,
                        'no_sizes_available',
                      ),
                      style: TextStyle(fontSize: 12, color: mat.Colors.grey),
                    )
                  : Wrap(
                      children: List.generate(
                        widget.product.sizes.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = index;
                            });
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            duration: Duration(milliseconds: 250),
                            child: Text(
                              widget.product.sizes[index].name,
                              style: TextStyle(
                                fontSize: selectedSize == index ? 16 : 13,
                                fontWeight: selectedSize == index
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                                decoration: selectedSize == index
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MyButton2(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 16,
                              color: mat.Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          if (counter > 1) {
                            counter--;
                            price = (double.parse(widget.product.purchasingPrice) * counter);
                            if (counter <= 1) {
                              OrdersPointer.selectedProducts.forEach((element) {
                                if (element.productDetailId.toString() == widget.product.id.toString()) {OrdersPointer.selectedProducts.remove(element);
                                }
                              });
                            } else {
                              OrdersPointer.selectedProducts.forEach((element) {
                                if (element.productDetailId.toString() == widget.product.id.toString()) {
                                  element.quantity = counter;
                                }
                              });
                            }
                            setState(() {});
                          } else {
                            price = double.parse(widget.product.purchasingPrice);
                            setState(() {});
                          }

                          widget.onCounterChange();
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
                              color: mat.Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            counter++;
                            price = (double.parse(widget.product.purchasingPrice) * counter);
                          });
                        },
                        width: 40,
                        height: 30,
                      ),
                    ],
                  ),
                  MyButton(
                    AppUtils.translate(context, 'add'),
                    width: MediaQuery.of(context).size.width / 4,
                    onTap: () {
                      if (OrdersPointer.selectedProducts.isEmpty) {
                        OrdersPointer.selectedProducts.add(
                          OrdersBean(
                            quantity: counter,
                            colorId: widget.product.colors.isEmpty ? null : widget.product.colors[selectedColor].id.toString(),
                            sizeId: widget.product.sizes.isEmpty ? null : widget.product.sizes[selectedSize].id.toString(),
                            productDetailId: widget.product.id.toString(),
                          ),
                        );
                      } else {
                        bool isExist = false;
                        int index = -1;

                       for(int i = 0; i < OrdersPointer.selectedProducts.length; i++) {
                         if (OrdersPointer.selectedProducts[i].productDetailId.toString() == widget.product.id.toString()) {
                           isExist = true;
                           index = i;
                         }
                       }

                        if(isExist) {
                          OrdersPointer.selectedProducts[index].quantity = counter;
                          OrdersPointer.selectedProducts[index].colorId = widget.product.colors[selectedColor].id.toString();
                          OrdersPointer.selectedProducts[index].sizeId = widget.product.sizes[selectedSize].id.toString();
                        } else {
                          OrdersPointer.selectedProducts.add(
                            OrdersBean(
                              quantity: counter,
                              colorId: widget.product.colors.isEmpty ? null : widget.product.colors[selectedColor].id.toString(),
                              sizeId: widget.product.sizes.isEmpty ? null : widget.product.sizes[selectedSize].id.toString(),
                              productDetailId: widget.product.id.toString(),
                            ),
                          );
                        }
                      }

                      widget.onCounterChange();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
