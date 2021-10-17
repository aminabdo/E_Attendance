import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:E_Attendance/Bles/Bloc/OrderBloc.dart';
import 'package:E_Attendance/Bles/Model/Requests/AddProductTopdOrder.dart';
import 'package:E_Attendance/Bles/Model/Responses/order/AllProductsResponse.dart';
import 'package:E_Attendance/E_Attendance_user/data/repository/attendance_repository_imp.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button.dart';
import 'package:E_Attendance/widgets/my_button2.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
import 'package:E_Attendance/widgets/my_text_form_field.dart';
import 'package:get/get.dart';

class AttendanceListPage extends StatefulWidget {
  final dynamic orderId;

  const AttendanceListPage({Key key, @required this.orderId}) : super(key: key);

  @override
  _AttendanceListPageState createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {
  @override
  void initState() {
    super.initState();
    AttendanceRepositoryImp().getAttendanceData();
  }

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
      isLoading: false,
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
                  'next'.tr,
                  style: TextStyle(color: mat.Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('TEST1',
                  style: TextStyle(color: mat.Colors.white),
                )
              ],
            ),
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
                        text: 'add_new_order'.tr,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: MyTextFormField(
                                borderWidth: 1,
                                hintText: 'search_by_name'.tr,
                                prefixIcon:
                                    Image.asset('assets/images/search.png'),
                                onChanged: (txt) async {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<AllProductsResponse>(
                        stream: orderBloc.search_products.stream,
                        builder: (context, snapshot) {
                          if (orderBloc.search_products.value?.loading ??
                              false) {
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
                            return ListView.separated(
                              //change this too
                                separatorBuilder: (BuildContext context, int index) => const Divider(),
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("تاريخ اليوم"),
                                      Text("ميعاد الحضور"),
                                      Text("ميعاد الانصراف"),
                                    ],
                                  );
                                });
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

class AttendanceListItem extends StatefulWidget {
  final Products product;
  final Function() onCounterChange;

  const AttendanceListItem({Key key, this.product, this.onCounterChange})
      : super(key: key);

  @override
  _AttendanceListItemState createState() => _AttendanceListItemState();
}

class _AttendanceListItemState extends State<AttendanceListItem> {
  int selectedColor = 0;
  int selectedSize = 0;

  int counter = 1;

  double price, totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                  Flexible(child: Text(widget.product.difference)),
                  Flexible(
                    child: Text('$totalPrice ${'eg'.tr}'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(child: Text("${"show_products_quantity".tr}")),
                  SizedBox(
                    width: 25,
                  ),
                  Flexible(child: Text("${widget.product.quantity}"))
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text('colors'.tr),
              SizedBox(
                height: 10,
              ),
              widget?.product?.colors?.isEmpty ?? false
                  ? Text(
                      'no_colors_available'.tr,
                      style: TextStyle(fontSize: 12, color: mat.Colors.grey),
                    )
                  : Wrap(
                      children: List.generate(
                        widget?.product?.sizes?.length ?? 5,
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
                              // backgroundColor: Color(int.parse(
                              //     '${widget.product.colors[index]?.colorCode}'??'0xff000000')),
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
              Text('sizes'.tr),
              SizedBox(
                height: 5,
              ),
              widget?.product?.sizes?.isEmpty ?? true
                  ? Text(
                      'no_sizes_available'.tr,
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
                            totalPrice = price * counter;
                          });
                        },
                        width: 40,
                        height: 30,
                      ),
                    ],
                  ),
                  MyButton(
                    'add'.tr,
                    width: MediaQuery.of(context).size.width / 4,
                    onTap: () {
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
