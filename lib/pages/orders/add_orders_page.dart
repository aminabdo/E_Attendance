
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/Bles/Bloc/old/HomeBloc.dart';
import 'package:qimma/Bles/Model/Requests/AddpdOrderRequest.dart';
import 'package:qimma/Bles/Model/Responses/order/AllUsersResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_loader.dart';

class AddOrdersPage extends StatefulWidget {
  @override
  _AddOrdersPageState createState() => _AddOrdersPageState();
}

class _AddOrdersPageState extends State<AddOrdersPage> {
  bool isLoading = false;
  bool gotFirstCategoryProducts = false;
  bool gotData = false;

  List<Users> users;
  Users selectedUser;

  String selectedPriceType;
  List<String> priceTypes;

  @override
  void initState() {
    super.initState();

    orderBloc.getAllUsers();
    homeBloc.get_main_cat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    priceTypes = [
      AppUtils.translate(context, 'whole_whole_sale'),
      AppUtils.translate(context, 'whole_sale'),
      AppUtils.translate(context, 'sale'),
    ];

    if (!gotFirstCategoryProducts) {
      if (homeBloc.s_get_main_cat.value != null &&
          homeBloc.s_get_main_cat.value.data != null) {
        homeBloc.getProductsByCat(homeBloc.s_get_main_cat.value.data[0].id);
        gotFirstCategoryProducts = true;
      }
    }
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading,
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
              StreamBuilder<AllUsersResponse>(
                stream: orderBloc.all_users.stream,
                builder: (context, snapshot) {
                  if (orderBloc.all_users.value.loading) {
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
                    if (!gotData) {
                      users = snapshot.data.data;
                      selectedUser = users[0];
                      selectedPriceType = priceTypes[0];
                      gotData = true;
                    }
                    return Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppUtils.translate(context, 'customer_name')),
                          Container(
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Users>(
                                value: selectedUser,
                                items: users.map((Users value) {
                                  return new DropdownMenuItem<Users>(
                                    value: value,
                                    child: Text(
                                        '${value.firstName} ${value.lastName}'),
                                  );
                                }).toList(),
                                onChanged: (user) {},
                              ),
                            ),
                          ),
                          space(context),
                          Text(
                              AppUtils.translate(context, 'customer_location')),
                          Container(
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Users>(
                                value: selectedUser,
                                items: users.map((Users value) {
                                  return new DropdownMenuItem<Users>(
                                    value: value,
                                    child: Text(
                                        '${value.firstName} ${value.lastName}'),
                                  );
                                }).toList(),
                                onChanged: (user) {},
                              ),
                            ),
                          ),
                          space(context),
                          Text(AppUtils.translate(context, 'price_type')),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedPriceType,
                                items: priceTypes.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (priceType) {
                                  setState(() {
                                    selectedPriceType = priceType;
                                  });
                                },
                              ),
                            ),
                          ),
                          space(context),
                          MyButton(
                            AppUtils.translate(context, 'next'),
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });

                              var request = AddOrderRequest(
                                userId: selectedUser.id.toString(),
                                addressId: null,
                                priceType: getPriceType(),
                              );

                              print(request.toString());

                              var response = await orderBloc.addOrder(request);
                              if(response.status == 1) {
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                AppUtils.showToast(msg: response.message);
                              }
                            },
                          ),
                          space(context),
                          space(context),
                        ],
                      ),
                    );
                  }
                },
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

  String getPriceType() {
    if (selectedPriceType == priceTypes[0]) {
      return '1';
    } else if (selectedPriceType == priceTypes[1]) {
      return '2';
    } else {
      return '3';
    }
  }
}
