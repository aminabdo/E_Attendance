import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:E_Attendance/Bles/Bloc/OrderBloc.dart';
import 'package:E_Attendance/Bles/Bloc/print/PrintBloc.dart';
import 'package:E_Attendance/Bles/Model/Requests/EditStatusRequest.dart';
import 'package:E_Attendance/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:E_Attendance/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:E_Attendance/pages/track_order_map/track_order_map_page.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../../E_Attendance_user/home_page.dart';
import 'new_orders.dart';

class EditOrder extends StatefulWidget {
  final int id;
  const EditOrder({Key key, @required this.id}) : super(key: key);

  @override
  _EditOrderState createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  @override
  void initState() {
    super.initState();

    orderBloc.singleOrder(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<SinglepdOrderResponse>(
          stream: orderBloc.s_single_P_d_order.stream,
          builder: (context, snapshot) {
            if (orderBloc.s_single_P_d_order.value.loading) {
              return Loader();
            } else {
              var order = snapshot.data.AllpdOrder;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space(context),
                      MyAppBar(
                        text:
                            '${AppUtils.translate(context, 'id')}:  ${order.id}',
                        actions: [
                          GestureDetector(
                            child: Image.asset('assets/images/location2.png'),
                            onTap: () async {
                              String googleUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${order.lat},${order.lng}';
                              if (await canLaunch(googleUrl)) {
                                await launch(googleUrl);
                              } else {
                                print(
                                    'https://www.google.com/maps/search/?api=1&query=${order.lat},${order.lng}');
                                AppUtils.showToast(
                                    msg: 'Could not open the map.');
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => TrackOrderMapPage(),
                              //   ),
                              // );
                            },
                          ),
                        ],
                      ),
                      space(context),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppUtils.translate(context, 'customer_name'),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  order.name,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await launch("tel://${order.phone}");
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          AppUtils.translate(
                                              context, 'customer_number'),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          order.phone ?? '',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Image.asset(
                                        'assets/images/phone.png',
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Icon(
                                        Localizations.localeOf(context)
                                                    .languageCode ==
                                                'en'
                                            ? Icons.arrow_forward_ios_rounded
                                            : Icons.arrow_back_ios_rounded,
                                        color: Colors.black,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      space(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        AppUtils.translate(context, 'delivery'),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: order.paymentMethod == 'online'
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
                                      order.paymentMethod,
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
                          Row(
                            children: [
                              Image.asset('assets/images/time.png'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${order.status} ${AppUtils.translate(context, 'minutes')}',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                        ],
                      ),
                      space(context),
                      Row(
                        children: [
                          Text(
                            '${AppUtils.translate(context, 'id')}: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '${order.id}',
                            style: TextStyle(),
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
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemEdit(
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
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            orderBloc
                                .s_single_P_d_order.value.AllpdOrder.products
                                .forEach((element) {
                              log(element.toString());
                            });
                            log("------->>>>><<<<<-------");
                            log("${orderBloc.s_single_P_d_order.value.AllpdOrder.toJson()}");
                            log("------->>>>><<<<<-------");
                            orderBloc.editOrder(
                                orderBloc.s_single_P_d_order.value.AllpdOrder);
                            AppUtils.showToast(
                                msg:
                                    "${AppUtils.translate(context, "order_updated_succes")}");

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => HomePage()),
                                (route) => false);
                          },
                          color: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          textColor: Colors.white,
                          child: Text(
                              '${AppUtils.translate(context, "edit_order")}'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}

class ItemEdit extends StatefulWidget {
  final Products_Order_Bean item;

  const ItemEdit({Key key, this.item}) : super(key: key);

  @override
  _ItemEditState createState() => _ItemEditState();
}

class _ItemEditState extends State<ItemEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (widget.item?.image == null)
                    CachedNetworkImage(
                      imageUrl: "",
                      width: 35,
                      errorWidget: (_, __, ___) {
                        return Image.asset('assets/images/no_image.png');
                      },
                      height: 35,
                    )
                  else
                    CachedNetworkImage(
                      imageUrl: widget.item?.image,
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
                      '${widget.item?.Difference}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {
                orderBloc.s_single_P_d_order.value.AllpdOrder.products
                    .remove(widget.item);
                widget.item.quantity++;
                orderBloc.s_single_P_d_order.value.AllpdOrder.products
                    .add(widget.item);
                orderBloc.s_single_P_d_order.value.AllpdOrder.calctotal();
                setState(() {});
              },
              color: mainColor,
              textColor: Colors.white,
              child: Text('${AppUtils.translate(context, "+")}'),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${widget.item.quantity}  X   ',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
            Text(
              '${widget.item.price} ${AppUtils.translate(context, "eg")}',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              width: 8,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {
                if (widget.item.quantity == 0) {
                  return;
                }
                orderBloc.s_single_P_d_order.value.AllpdOrder.products
                    .remove(widget.item);
                widget.item.quantity--;
                orderBloc.s_single_P_d_order.value.AllpdOrder.products
                    .add(widget.item);
                orderBloc.s_single_P_d_order.value.AllpdOrder.calctotal();
                setState(() {});
              },
              color: mainColor,
              textColor: Colors.white,
              child: Text('${AppUtils.translate(context, "-")}'),
            )
          ],
        ),
      ],
    );
  }
}
