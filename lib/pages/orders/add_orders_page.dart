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

import 'products_page.dart';

class AddOrdersPage extends StatefulWidget {
  @override
  _AddOrdersPageState createState() => _AddOrdersPageState();
}

class _AddOrdersPageState extends State<AddOrdersPage> {
  bool isLoading = false;
  bool gotFirstCategoryProducts = false;
  bool gotData = false;

  List<Users> users;
  List<Addresses> addresses = [];
  Users selectedUser;

  String selectedPriceType;
  Addresses selectedAddress;
  List<String> priceTypes;

  bool isstate = false;
  @override
  void initState() {
    super.initState();

    orderBloc.getAllUsers();
    homeBloc.get_main_cat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if(!isstate) {
      priceTypes = [
        AppUtils.translate(context, 'whole_whole_sale'),
        AppUtils.translate(context, 'whole_sale'),
        AppUtils.translate(context, 'sale'),
      ];
      isstate = true;
    }

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
                      addresses = selectedUser.addresses;
                      print("addresses ----- >>> "+addresses.toString());
                      if(addresses.isNotEmpty) {
                        selectedAddress = addresses[0];
                      }
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
                                onChanged: (user) {
                                  setState(() {
                                    selectedUser = user;
                                    addresses = [];
                                    addresses = selectedUser.addresses;
                                    selectedAddress = addresses.isNotEmpty
                                        ? addresses[0]
                                        : null;


                                    setState(() {

                                    });
                                    print("status -------> ${selectedUser.status}");
                                    if(selectedUser.status == 1){
                                      print("statues 111111111111111");
                                      selectedPriceType = AppUtils.translate(context, 'sale');
                                      priceTypes = [AppUtils.translate(context, 'sale')];
                                    }
                                    else if(selectedUser.status == 2){
                                      print("statues 22222222222222");
                                      selectedPriceType = AppUtils.translate(context, 'whole_sale');
                                      priceTypes = [AppUtils.translate(context, 'whole_sale')];
                                    }
                                    else if(selectedUser.status == 4){
                                      print("statues 44444444444444");
                                      selectedPriceType = AppUtils.translate(context, 'whole_whole_sale');
                                      priceTypes = [AppUtils.translate(context, 'whole_whole_sale')];
                                    }
                                    else{
                                      priceTypes = [] ;
                                    }


                                    setState(() {

                                    });
                                  });
                                },
                              ),
                            ),
                          ),
                          space(context),
                          Text(
                              AppUtils.translate(context, 'customer_location')),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Addresses>(
                                value: selectedAddress,
                                items: addresses.map((Addresses value) {
                                  return new DropdownMenuItem<Addresses>(
                                    value: value,
                                    child: Text(value.address),
                                  );
                                }).toList(),
                                onChanged: (address) {
                                  setState(() {
                                    selectedAddress = address;
                                  });
                                },
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
                                addressId:
                                    selectedAddress.id.toString() ?? null,
                                priceType: selectedUser.status.toString(),
                              );

                              print(request.toString());

                              var response = await orderBloc.addOrder(request);
                              if (response.status == 1) {
                                setState(() {
                                  isLoading = false;
                                });

                                AppUtils.showToast(
                                    msg: AppUtils.translate(context, 'done'),
                                    bgColor: mainColor);
                                orderBloc.getAllProducts();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ProductsPage(
                                      orderId: response.data.id,
                                    ),
                                  ),
                                );
                              } else {
                                AppUtils.showToast(msg: response.message);
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          ),
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
