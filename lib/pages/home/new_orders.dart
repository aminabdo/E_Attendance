
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qimma/pages/home/order_details.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';

class NewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 5,
        );
      },
      itemCount: 5,
    );
  }
}

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/shampo.png'),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "shampoo’s vegan",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '250g x2',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
        Text(
          '512 ${AppUtils.translate(context, 'eg')}',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetails(),),);
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
                            border: Border.all(color: mainColor),
                            color: secondColor,
                          ),
                          child: Center(
                            child: Text(
                              AppUtils.translate(context, 'online_paid'),
                              style: TextStyle(
                                color: mainColor,
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
                        Text('15 ${AppUtils.translate(context, 'minutes')}',  style: TextStyle(color: Colors.black45),),
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
                      '#298498656458',
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
                    return Item();
                  },
                  itemCount: 3,
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
                Text('Mohamed Ahmed Mahmoud'),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppUtils.translate(context, 'shop_location'), style: TextStyle(color: Colors.grey)),
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
                          Flexible(child: Text('123 Hoan Kiem, Ha...', style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12,),),),
                          Icon(Localizations.localeOf(context).languageCode == 'en' ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded, size: 16, color: mainColor,),
                        ],
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset('assets/images/location.png'),
                          SizedBox(width: 4,),
                          Flexible(child: Text('123 Hoan Kiem, Ha...', style: TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 12,),)),
                          Icon(Localizations.localeOf(context).languageCode == 'en' ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded, size: 16, color: mainColor,),
                        ],
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
                Text(AppUtils.translate(context, 'shop_owner_amount'), style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '512 ${AppUtils.translate(context, 'eg')}',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.red),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: secondColor,
                          ),
                          child: Center(
                            child: Text(
                              AppUtils.translate(context, 'deny'),
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
                          height: 40,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: mainColor,
                          ),
                          child: Center(
                            child: Text(
                              AppUtils.translate(context, 'accept'),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

