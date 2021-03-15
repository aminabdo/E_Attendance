
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:qimma/pages/home/order_details.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_loader.dart';

class NewOrders extends StatefulWidget {

  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {

  @override
  void initState() {
    super.initState();

    orderBloc.allOrder();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AllpdOrderResponse>(
      stream: orderBloc.all_orders.stream,
      builder: (context, snapshot) {
        if(orderBloc.all_orders.value.loading) {
          return Loader();
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderItem(
                order: snapshot.data.data[index]
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5,
              );
            },
            itemCount: snapshot.data.data.length,
          );
        }
      }
    );
  }
}

class Item extends StatelessWidget {

  final ProductsBean item;

  const Item({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CachedNetworkImage(imageUrl: item.ProductDetail.image, width: 35, height: 35,),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                item.ProductDetail.differenceAr,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        Text(
          '${item.ProductDetail.price} ${AppUtils.translate(context, 'eg')}',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {

  final Order order;

  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetails(
          id: order.id,
        ),),);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: secondColor,
                          ),
                          child: Center(
                            child: Text(
                              AppUtils.translate(context, 'delivery'),
                              style: TextStyle(
                                fontSize: 13,
                                color: order.paymentMethod == 'online' ? mainColor : secondColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 35,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: order.paymentMethod == 'online' ? mainColor : secondColor,),
                            color: order.paymentMethod == 'online' ? mainColor : secondColor,
                          ),
                          child: Center(
                            child: Text(
                              AppUtils.translate(context, 'online_paid'),
                              style: TextStyle(
                                color: order.paymentMethod == 'online' ? mainColor : secondColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/time.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${order.status} ${AppUtils.translate(context, 'minutes')}',  style: TextStyle(color: Colors.black45),),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '${AppUtils.translate(context, 'id')}: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                     order.id.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppUtils.translate(context, 'items')}: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      AppUtils.translate(context, 'customer_amount'),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Item(
                      item: order.products[index],
                    );
                  },
                  itemCount: order.products.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8,
                    );
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Text(AppUtils.translate(context, 'customer_name'), style: TextStyle(color: Colors.grey),),
                Text(order.name),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(AppUtils.translate(context, 'shop_location'), style: TextStyle(color: Colors.grey)),
                    Text(AppUtils.translate(context, 'customer_location'), style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset('assets/images/location.png'),
                          SizedBox(width: 4,),
                          Flexible(child: Text(order.address, style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12,),),),
                          Icon(Localizations.localeOf(context).languageCode == 'en' ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded, size: 16, color: mainColor,),
                        ],
                      ),
                    ),
                    // SizedBox(width: 8,),
                    // Expanded(
                    //   child: Row(
                    //     children: [
                    //       Image.asset('assets/images/location.png'),
                    //       SizedBox(width: 4,),
                    //       Flexible(child: Text('3 Hoan Kiem, Ha...'12, style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12,),)),
                    //       Icon(Localizations.localeOf(context).languageCode == 'en' ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded, size: 16, color: mainColor,),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                SizedBox(
                  height: 18,
                ),
                // Text(AppUtils.translate(context, 'shop_owner_amount'), style: TextStyle(color: Colors.grey)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       '512 ${AppUtils.translate(context, 'eg')}',
                //       textAlign: TextAlign.right,
                //       style: TextStyle(color: Colors.red),
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           height: 40,
                //           width: size.width / 4,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5),
                //             color: secondColor,
                //           ),
                //           child: Center(
                //             child: Text(
                //               AppUtils.translate(context, 'deny'),
                //               style: TextStyle(
                //                 color: Colors.grey,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 8,
                //         ),
                //         Container(
                //           height: 40,
                //           width: size.width / 4,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5),
                //             color: mainColor,
                //           ),
                //           child: Center(
                //             child: Text(
                //               AppUtils.translate(context, 'accept'),
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

