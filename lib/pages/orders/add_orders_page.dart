import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/Bles/Bloc/client_bloc.dart';
import 'package:qimma/Bles/Bloc/old/HomeBloc.dart';
import 'package:qimma/Bles/Model/Requests/AddpdOrderRequest.dart';
import 'package:qimma/Bles/Model/Responses/client/ClientOfRepresentativeResponse.dart';
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

  List<ClientBean> users;
  List<AddressesBean> addresses = [];
  ClientBean selectedUser;

  String selectedPriceType;
  AddressesBean selectedAddress;
  List<String> priceTypes;

  bool isstate = false;
  @override
  void initState() {
    super.initState();

    //orderBloc.getAllUsers();
    homeBloc.get_main_cat();
    clientBloc.getClientsOfRepresentative();
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
              StreamBuilder<ClientOfRepresentativeResponse>(
                stream: clientBloc.all_clients_of_representative.stream,
                builder: (context, snapshot) {
                  if (clientBloc.all_clients_of_representative.value.loading) {
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
                      if(users.isEmpty || users == null){

                      }
                      else{
                        selectedUser = users[0];
                        selectedPriceType = priceTypes[0];
                        addresses = selectedUser.addresses;
                        print("addresses ----- >>> "+addresses.toString());
                        if(addresses.isNotEmpty) {
                          selectedAddress = addresses[0];
                        }
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
                              child: DropdownButton<ClientBean>(
                                value: selectedUser,
                                items: users.map((ClientBean value) {
                                  return new DropdownMenuItem<ClientBean>(
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
                                    else if(selectedUser.status == 3){
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
                              child: DropdownButton<AddressesBean>(
                                value: selectedAddress,
                                items: addresses.map((AddressesBean value) {
                                  return new DropdownMenuItem<AddressesBean>(
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
                              if(selectedUser == null ){
                                setState(() {
                                  isLoading = false;
                                });
                                AppUtils.showToast(
                                    msg: AppUtils.translate(context, 'يرجي اختيار عميل'),
                                    bgColor: mainColor);
                                return;
                              }
                              var price_type = 3 ;
                              if(selectedUser.status == 1){
                                price_type =3 ;
                              }else if(selectedUser.status ==3){
                                price_type = 2 ;
                              }else if(selectedUser.status == 4 ){
                                price_type = 1 ;
                              }
                              var request = AddOrderRequest(
                                userId: selectedUser.id.toString(),
                                addressId:
                                    selectedAddress?.id.toString() ?? null,
                                priceType: price_type.toString(),
                              );

                              print(request.toString());
                              // try {
                                var response = await orderBloc.addOrder(
                                    request);
                                if (response.status == 1) {
                                  log("response -----> ==> ${response.status}");
                                  AppUtils.showToast(
                                      msg: AppUtils.translate(context, 'done'),
                                      bgColor: mainColor);
                                  orderBloc.getAllProducts();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ProductsPage(
                                            orderId: response.data.id,
                                          ),
                                    ),
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  log("response else -----> ==> ${response.status}");
                                  AppUtils.showToast(msg: response.message);
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              // }
                              // catch(e){
                              //   log("catch ${e.toString()}");
                              //   setState(() {
                              //     isLoading = false;
                              //   });
                              // }
                              // finally{
                              //   log("finaly");
                              //   setState(() {
                              //     isLoading = false;
                              //   });
                              // }
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
