import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qimma/pages/orders/add_item_page.dart';
import 'package:qimma/pages/orders/select_location_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_button2.dart';
import 'package:qimma/widgets/my_loader.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class AddOrdersPage extends StatefulWidget {
  @override
  _AddOrdersPageState createState() => _AddOrdersPageState();
}

class _AddOrdersPageState extends State<AddOrdersPage> {

  bool adding = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoadingOverlay(
        isLoading: adding,
        progressIndicator: Loader(),
        color: Colors.white,
        opacity: .5,
        child: SingleChildScrollView(
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    MyTextFormField(
                      hintText: AppUtils.translate(context, 'customer_name',),
                    ),
                    space(context),
                    MyTextFormField(
                      hintText: AppUtils.translate(context, 'customer_number'),
                    ),
                    space(context),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: secondColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SelectLocationPage(
                                        title: AppUtils.translate(context, 'add_customer_location'),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/location.png'),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Flexible(
                                      child: Text(
                                        AppUtils.translate(context, 'add_customer_location'),
                                        style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
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
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppUtils.translate(context, 'items'),
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                          ),
                        ),
                        MyButton2(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                AppUtils.translate(context, 'add_item').toUpperCase(),
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          width: size.width * .4,
                          height: 40,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddItemPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 8),
                    //   decoration: BoxDecoration(
                    //       color: secondColor,
                    //       borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       ListView.separated(
                    //         shrinkWrap: true,
                    //         physics: NeverScrollableScrollPhysics(),
                    //         itemBuilder: (context, index) {
                    //           return Row(
                    //             children: [
                    //               Icon(
                    //                 Icons.cancel_outlined,
                    //                 color: Colors.grey,
                    //                 size: 20,
                    //               ),
                    //               SizedBox(
                    //                 width: 8,
                    //               ),
                    //               Image.asset('assets/images/shampo.png'),
                    //               SizedBox(
                    //                 width: 8,
                    //               ),
                    //               Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     "shampoo’s vegan",
                    //                     style: TextStyle(color: Colors.black45),
                    //                   ),
                    //                   Text(
                    //                     '250g x2',
                    //                     style: TextStyle(color: Colors.grey),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //         itemCount: 3,
                    //         separatorBuilder: (BuildContext context, int index) {
                    //           return SizedBox(
                    //             height: 8,
                    //           );
                    //         },
                    //       ),
                    //       SizedBox(
                    //         height: 18,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
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
                    MyTextFormField(
                      hintText: AppUtils.translate(context, 'shop_owner_name'),
                    ),
                    space(context),
                    MyTextFormField(
                      hintText: AppUtils.translate(context, 'owner_number'),
                    ),
                    space(context),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: secondColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SelectLocationPage(
                                        title: AppUtils.translate(context, 'add_shop_location'),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/location.png'),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Flexible(
                                      child: Text(
                                        AppUtils.translate(context, 'add_shop_location'),
                                        style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
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
                    space(context),
                    MyButton(AppUtils.translate(context, 'add'), onTap: () {

                    },),
                    space(context),
                    space(context),
                  ],
                ),
              ),
            ],
          ),
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
