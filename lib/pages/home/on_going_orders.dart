import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/Bles/Model/Responses/order/FinishedOrdersResponse.dart';
import 'package:qimma/pages/home/order_details.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class OnGoingOrdersPage extends StatefulWidget {
  @override
  _OnGoingOrdersPageState createState() => _OnGoingOrdersPageState();
}

class _OnGoingOrdersPageState extends State<OnGoingOrdersPage> {
  @override
  void initState() {
    super.initState();
    orderBloc.getFinishedOrders();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FinishedOrdersResponse>(
      stream: orderBloc.finished_orders.stream,
      builder: (context, snapshot) {
        if (orderBloc.finished_orders.value.loading) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
              ),
              Loader(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
              ),
            ],
          );
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            //physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderItem(finishedOrder: snapshot.data.data[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5,
              );
            },
            itemCount: snapshot.data.data.length,
          );
        }
      },
    );
  }
}

class Item extends StatelessWidget {
  final FinshedOrderProductsBean item;

  const Item({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: item?.image ?? '' ,
                width: 35,
                errorWidget: (_, __, ___) {
                  return Image.asset('assets/images/no_image.png');
                },
                height: 35,
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  '${item?.mainProductName}',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Text(
          '${item?.price} ${AppUtils.translate(context, 'eg')}',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final FinshedOrderBean finishedOrder;

  const OrderItem({Key key, this.finishedOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => OrderDetails(
              id: finishedOrder.id,
            ),
          ),
        );
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
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: secondColor,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  AppUtils.translate(context, 'delivery'),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: finishedOrder.paymentMethod == 'online'
                                        ? mainColor
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              border: Border.all(color: mainColor),
                              color: mainColor,
                            ),
                            child: Center(
                              child: Text(
                                finishedOrder.status,
                                style: TextStyle(
                                  color: secondColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset('assets/images/time.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${AppUtils.calcDate(context, finishedOrder.createdAt)}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
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
                      finishedOrder.id.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                finishedOrder.products.isEmpty
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 10,
                      ),
                finishedOrder.products.isEmpty
                    ? SizedBox.shrink()
                    : Row(
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
                finishedOrder.products.isEmpty
                    ? SizedBox.shrink()
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Item(
                            item: finishedOrder.products[index],
                          );
                        },
                        itemCount: finishedOrder.products.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 8,
                          );
                        },
                      ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  AppUtils.translate(context, 'customer_name'),
                  style: TextStyle(color: Colors.grey),
                ),
                Text(finishedOrder.name),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(AppUtils.translate(context, 'shop_location'), style: TextStyle(color: Colors.grey)),
                    Text(
                      AppUtils.translate(context, 'customer_location'),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          String googleUrl =
                              'https://www.google.com/maps/search/?api=1&query=${finishedOrder.lat},${finishedOrder.lng}';
                          if (await canLaunch(googleUrl)) {
                            await launch(googleUrl);
                          } else {
                            print(
                                'https://www.google.com/maps/search/?api=1&query=${finishedOrder.lat},${finishedOrder.lng}');
                            AppUtils.showToast(msg: 'Could not open the map.');
                          }
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/location.png'),
                            SizedBox(
                              width: 4,
                            ),
                            Flexible(
                              child: Text(
                                finishedOrder.address,
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Icon(
                              Localizations.localeOf(context).languageCode ==
                                      'en'
                                  ? Icons.arrow_forward_ios_rounded
                                  : Icons.arrow_back_ios_rounded,
                              size: 16,
                              color: mainColor,
                            ),
                          ],
                        ),
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
