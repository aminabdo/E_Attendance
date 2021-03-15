import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:qimma/pages/track_order_map/track_order_map_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_loader.dart';

import 'new_orders.dart';

class OrderDetails extends StatefulWidget {

  final int id;

  const OrderDetails({Key key, @required this.id}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

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
         if(orderBloc.s_single_P_d_order.value.loading) {
           return Loader();
         } else {
           var order = snapshot.data.data;
           return SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.all(14.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   space(context),
                   MyAppBar(
                     text: '${AppUtils.translate(context, 'id')}:  ${order.id}',
                     actions: [
                       GestureDetector(
                         child: Image.asset('assets/images/location2.png'),
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (_) => TrackOrderMapPage(),
                             ),
                           );
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
                         child: Row(
                           children: [
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: [
                                   Text(
                                     AppUtils.translate(context, 'customer_number'),
                                     style: TextStyle(color: Colors.grey),
                                   ),
                                   Text(
                                     order.phone,
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
                                   Localizations.localeOf(context).languageCode == 'en' ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded,
                                   color: Colors.black,
                                   size: 15,
                                 )
                               ],
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   space(context),
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
                               border: Border.all(color: order.paymentMethod == 'online' ? mainColor : secondColor,),
                               color: order.paymentMethod == 'online' ? mainColor : secondColor,
                             ),
                             child: Center(
                               child: Text(
                                 AppUtils.translate(context, 'delivery'),
                                 style: TextStyle(
                                   color: Colors.grey,
                                   fontSize: 13,
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
                               color: secondColor,
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
                           Text(
                             '${order.status}',
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
                         '${ AppUtils.translate(context, 'items')}: ',
                         style: TextStyle(color: Colors.grey),
                       ),
                       Text(
                         AppUtils.translate(context, 'customer_amount'),
                         style: TextStyle(color: Colors.grey),
                       ),
                     ],
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
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         AppUtils.translate(context, 'customer_location'),
                         style: TextStyle(color: Colors.grey),
                       ),
                       Text(
                         AppUtils.translate(context, 'customer_amount'),
                         style: TextStyle(color: Colors.grey),
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Expanded(
                         child: GestureDetector(
                           onTap: () {
                             // Navigator.of(context).push(
                             //   MaterialPageRoute(
                             //     builder: (_) => TrackOrderMapPage(),
                             //   ),
                             // );
                           },
                           child: Row(
                             children: [
                               Image.asset('assets/images/location.png'),
                               SizedBox(
                                 width: 4,
                               ),
                               Flexible(
                                 child: Text(
                                   order.address,
                                   style: TextStyle(
                                     color: mainColor,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 12,
                                   ),
                                 ),
                               ),
                               Icon(
                                 Localizations.localeOf(context).languageCode == 'en' ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded,
                                 size: 16,
                                 color: mainColor,
                               ),
                             ],
                           ),
                         ),
                       ),
                       SizedBox(
                         width: 8,
                       ),
                       Expanded(
                         child: Text(
                           '${order.totalPrice} ${AppUtils.translate(context, 'eg')}',
                           textAlign: TextAlign.end,
                           style: TextStyle(color: Colors.red),
                         ),
                       ),
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
                 ],
               ),
             ),
           );
         }
        }
      ),
    );
  }

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
