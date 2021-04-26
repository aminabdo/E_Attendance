import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/OrderBloc.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_loader.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class BillPage extends StatefulWidget {
  final dynamic orderId;


  const BillPage({Key key, @required this.orderId}) : super(key: key);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  double totalAll = 0.0  ;
  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
  @override
  void initState() {
    super.initState();

    totalAll = double.parse(orderBloc.add_product_to_order.value.data.totalPrice.toString());
    totalPriceController.text = totalAll.toString();

    discountValueController.text = "0";
    taxOneController.text = "0";
    taxTwoController.text = "0";

  }

  TextEditingController discountValueController = TextEditingController();
  TextEditingController taxOneController = TextEditingController();
  TextEditingController taxTwoController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController paidPriceController = TextEditingController();


  String discountType = 'نسبة';
  String selectedTaxOneType = 'نسبة';
  String selectedTaxTwoType = 'نسبة';

  int selected = 0;


  void onChange(int value) {
    if(value ==1){
      paidPriceController.text = totalPriceController.text;
    }
    else{
      paidPriceController.text = "0";
    }
    setState(() {
      selected = value;
    });
  }

  List<String> types = [
    'نسبة',
    'قيمة',
  ];

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    void calc(){
      log("start calc ------> ");
      double discount = 0.0;
      try{
        discount = double.parse(discountValueController.text ?? '0');
        log("discountValueController  ---> ${discountValueController.text}");
        log("discount value  ---> ${discount}");
      }catch(e){
        discount = 0.0;
      }
      double tax1 = 0.0;
      try{
        tax1 = double.parse(taxOneController.text ?? '0');
      }catch(e){
        tax1 = 0.0;
      }
      double tax2 = 0.0;
      try{
        tax2 = double.parse(taxTwoController.text ?? '0') ;
      }catch(e){
        tax2 = 0.0;
      }

      double total = 0.0 ;
      try{
        total = totalAll;
      }catch(e){
        total = 0.0;
      }
      int discountTy , tax1Type , tax2Type ;

      discountTy = discountType == types[1] ? 1 : 2;
      log("discountType ---> $discountTy");
      tax1Type = (selectedTaxOneType == types[1]) ? 1 : 2;
      log("selectedTaxOneType ---> $tax1Type");
      tax2Type = selectedTaxTwoType == types[1] ? 1 : 2;
      log("selectedTaxTwoType ---> $tax2Type");


      discount = (discountTy == 1) ?  discount :((discount/100) * total)  ;
      tax1 = (tax1Type == 1) ? tax1:((tax1/100) * total);
      tax2 = (tax2Type == 1) ? tax2 : ((tax2/100) * total);

      total = total - discount + tax1 + tax2;
      totalPriceController.text = total.toString();
      setState(() {
      });
    }
    return Scaffold(
      body: LoadingOverlay(
        progressIndicator: CircularProgressIndicator(),
        isLoading: isLoading,
        color: Colors.white.withOpacity(.5),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space(context),
                      MyAppBar(
                        text: AppUtils.translate(context, 'add_new_order'),
                      ),
                      space(context),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('نوع الدفع'),
                    Row(
                      children: [
                        Expanded(
                            child: RadioListTile(
                          value: 0,
                          groupValue: selected,
                          onChanged: onChange,
                          title: Text('دفع اجل'),
                        )),
                        Expanded(
                            child: RadioListTile(
                          value: 1,
                          groupValue: selected,
                          onChanged: onChange,
                          title: Text('دفع فوري'),
                        )),
                      ],
                    ),
                    space(context),
                    Text('نوع الخصم'),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                width: .5,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: discountType,
                                items: types.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (type) {
                                  setState(() {
                                    discountType = type;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                            child: MyTextFormField(
                          keyboardType: TextInputType.number,
                          hintText: 'القيمة',
                              onChanged: (text) {
                                calc();
                              },
                          controller: discountValueController,
                          radius: 2,
                        )),
                      ],
                    ),
                    space(context),
                    Text('الضريبة الاولي'),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                width: .5,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedTaxOneType,
                                items: types.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (type) {
                                  setState(() {
                                    selectedTaxOneType = type;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                            child: MyTextFormField(
                          hintText: 'القيمة',
                          controller: taxOneController,
                              onChanged: (text) {
                                calc();
                              },
                          keyboardType: TextInputType.number,
                          radius: 2,
                        )),
                      ],
                    ),
                    space(context),
                    Text('رسوم اخرى'),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: secondColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                width: .5,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedTaxTwoType,
                                items: types.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (type) {
                                  setState(() {
                                    selectedTaxTwoType = type;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                            child: MyTextFormField(
                          hintText: 'القيمة',
                          controller: taxTwoController,
                          keyboardType: TextInputType.number,
                              onChanged: (text) {
                                calc();
                              },
                          radius: 2,
                        )),
                      ],
                    ),
                    space(context),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('المجموع'),
                              MyTextFormField(
                                hintText: '',
                                enable: false,
                                controller: totalPriceController,
                                keyboardType: TextInputType.number,
                                radius: 2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('المدفوع'),
                              MyTextFormField(
                                hintText: '',
                                controller: paidPriceController,
                                keyboardType: TextInputType.number,
                                radius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    space(context),
                    MyButton(
                      'ارسال',
                      btnColor: discountValueController.text.isNotEmpty &&
                          taxTwoController.text.isNotEmpty &&
                          taxOneController.text.isNotEmpty ? mainColor : Colors.grey,

                      onTap: discountValueController.text.isEmpty &&
                          taxTwoController.text.isEmpty &&
                          taxOneController.text.isEmpty ? null :  () async {

                        setState(() {
                          isLoading = true;
                        });

                        if(discountValueController.text.length <= 0){
                          discountValueController.text ="0";
                        }
                        if(taxOneController.text.length <= 0){
                          taxOneController.text = "0";
                        }
                        if(taxTwoController.text.length <= 0){
                          taxTwoController.text = "0";
                        }
                          var response = await orderBloc.makeBill(
                            widget.orderId,
                            discountType == types[1] ? 1 : 2,
                            num.parse(discountValueController.text).toDouble(),
                            selectedTaxOneType == types[1] ? 1 : 2,
                            num.parse(taxOneController.text),
                            selectedTaxTwoType == types[1] ? 1 : 2,
                            num.parse(taxTwoController.text),
                            num.parse(paidPriceController.text).toDouble(),
                          );

                        setState(() {
                          isLoading = false;
                        });

                          if (response.status == 1) {
                            AppUtils.showToast(msg: AppUtils.translate(context, 'done'), bgColor: mainColor);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
                          } else {
                            AppUtils.showToast(msg: response.message);
                          }

                      },
                    ),
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
}
