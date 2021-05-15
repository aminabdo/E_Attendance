import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'dart:convert' show utf8;


import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qimma/Bles/Bloc/print/PrintBloc.dart';

class PrinterBloc{
  //
  // //BluetoothDevice _device;
  // bool connected = false;
  // String pathImage;
  //
  // connect(BluetoothDevice device, BlueThermalPrinter bluetooth){
  //   device_main = device;
  //   if (device_main == null) {
  //     AppUtils.showToast(msg: "you should select the device");
  //     log('No device selected.');
  //   } else {
  //     bluetooth.isConnected.then((isConnected) {
  //       if (!isConnected) {
  //         bluetooth.connect(device_main).catchError((error) {
  //            connected = false;
  //         });
  //         connected = true;
  //         bluetooth.printNewLine();
  //       }
  //     });
  //   }
  // }
  //
  // disconnect(BlueThermalPrinter bluetooth){
  //   base_bluetooth = bluetooth;
  //   bluetooth.disconnect();
  // }
  //
  // print(BlueThermalPrinter bluetooth){
  //   base_bluetooth = bluetooth;
  //   base_bluetooth.printCustom("HEADER",3,1);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printImage(pathImage);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printLeftRight("LEFT", "RIGHT",0);
  //   base_bluetooth.printLeftRight("LEFT", "RIGHT",1);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printLeftRight("LEFT", "RIGHT",2);
  //   base_bluetooth.printCustom("Body left",1,0);
  //   base_bluetooth.printCustom("Body right",0,2);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printCustom("Terimakasih",200,1);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printQRcode("234567890", 500,200,2);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.paperCut();
  // }
  //
  // printOrder(BuildContext context, Order_AllPD order) async{
  //   final arabicText = utf8.encode('ا ب ت ث ج ح ي');
  //   String decoded = await CharsetConverter.decode("utf-8",
  //       Uint8List.fromList(arabicText));
  //   String i =utf8.decode(arabicText);
  //   log("print ------->>>> ${decoded}");
  //   base_bluetooth.printCustom('${utf8.decode(arabicText)}', 2, 1,charset: "UTF-8");
  //   base_bluetooth.printCustom('${utf8.decode(arabicText)}', 2, 1);
  //   base_bluetooth.printCustom("------احمد---------", 1, 1,charset: "UTF-8");
  //   base_bluetooth.printCustom("------احمد---------", 1, 1,charset: "iso-8859-1");
  //   base_bluetooth.paperCut();
  //   return;
  //   base_bluetooth.printCustom("${AppUtils.translate(context, "invoice")} ${order.id}",3,1);
  //   base_bluetooth.printCustom("------احمد---------", 1, 1,charset: "utf8_bin");
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "customer_name")}",
  //       "${order.name}",1 ,charset: "UTF8");
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "phone_number")}",
  //       "${order.phone}",1 ,charset: "UTF8-bin");
  //   base_bluetooth.printCustom("-----------------------", 1, 1);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "items")}",
  //       "${AppUtils.translate(context, "price")}",1);
  //   base_bluetooth.printNewLine();
  //   for(var i = 0; i < order.products.length; i++){
  //     base_bluetooth.printLeftRight("${order.products[i].Difference}",
  //         "${order.products[i].quantity} X ${order.products[i].price}",1);
  //   }
  //   base_bluetooth.printCustom("-----------------------", 1, 1);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "tax1")}",
  //       "${order.tax1}",1);
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "tax2")}",
  //       "${order.tax2}",1);
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "discount")}",
  //       "${order.discount}",1);
  //   base_bluetooth.printCustom("-----------------------", 1, 1);
  //   base_bluetooth.printLeftRight("${AppUtils.translate(context, "total")}",
  //       "${order.totalPrice}",1);
  //   base_bluetooth.printNewLine();
  //   base_bluetooth.paperCut();
  // }
}
final printerBloc = PrinterBloc();