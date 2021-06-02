import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:qimma/Bles/Model/Responses/order/AllpdOrderResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:pdf/pdf.dart';

class PrinterBloc{

  BluetoothDevice _device;
  bool connected = false;
  String pathImage;
  BluetoothDevice device_main;
  BlueThermalPrinter base_bluetooth ;

  connect(BluetoothDevice device, BlueThermalPrinter bluetooth){
    device_main = device;
    if (device_main == null) {
      AppUtils.showToast(msg: "you should select the device");
      log('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(device_main).catchError((error) {
             connected = false;
          });
          connected = true;
          bluetooth.printNewLine();
        }
      });
    }
  }

  disconnect(BlueThermalPrinter bluetooth){
    base_bluetooth = bluetooth;
    bluetooth.disconnect();
  }

  print(BlueThermalPrinter bluetooth){
    base_bluetooth = bluetooth;
    base_bluetooth.printCustom("HEADER",3,1);
    base_bluetooth.printNewLine();
    base_bluetooth.printImage(pathImage);
    base_bluetooth.printNewLine();
    base_bluetooth.printLeftRight("LEFT", "RIGHT",0);
    base_bluetooth.printLeftRight("LEFT", "RIGHT",1);
    base_bluetooth.printNewLine();
    base_bluetooth.printLeftRight("LEFT", "RIGHT",2);
    base_bluetooth.printCustom("Body left",1,0);
    base_bluetooth.printCustom("Body right",0,2);
    base_bluetooth.printNewLine();
    base_bluetooth.printCustom("Terimakasih",200,1);
    base_bluetooth.printNewLine();
    base_bluetooth.printQRcode("234567890", 500,200,2);
    base_bluetooth.printNewLine();
    base_bluetooth.paperCut();
  }

  printOrder(BuildContext context, Order_AllPD order) async{
    testPrint(order);
    return ;
    base_bluetooth.printCustom("------احمد---------", 1, 1,charset: "UTF-8");
    base_bluetooth.printCustom("------احمد---------", 1, 1,charset: "iso-8859-1");
    base_bluetooth.paperCut();
    return;
    base_bluetooth.printCustom("${AppUtils.translate(context, "invoice")} ${order.id}",3,1);
    base_bluetooth.printCustom("------احمد---------", 1, 1,charset: "utf8_bin");
    base_bluetooth.printNewLine();
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "customer_name")}",
        "${order.name}",1 ,charset: "UTF8");
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "phone_number")}",
        "${order.phone}",1 ,charset: "UTF8-bin");
    base_bluetooth.printCustom("-----------------------", 1, 1);
    base_bluetooth.printNewLine();
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "items")}",
        "${AppUtils.translate(context, "price")}",1);
    base_bluetooth.printNewLine();
    for(var i = 0; i < order.products.length; i++){
      base_bluetooth.printLeftRight("${order.products[i].Difference}",
          "${order.products[i].quantity} X ${order.products[i].price}",1);
    }
    base_bluetooth.printCustom("-----------------------", 1, 1);
    base_bluetooth.printNewLine();
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "tax1")}",
        "${order.tax1}",1);
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "tax2")}",
        "${order.tax2}",1);
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "discount")}",
        "${order.discount}",1);
    base_bluetooth.printCustom("-----------------------", 1, 1);
    base_bluetooth.printLeftRight("${AppUtils.translate(context, "total")}",
        "${order.totalPrice}",1);
    base_bluetooth.printNewLine();
    base_bluetooth.paperCut();
  }
  testPrint( Order_AllPD order) async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    //bluetooth.printCustom("HEADER",3,1);

    if(base_bluetooth == null ) {

    }

    log(getPrintedHtml(order));
    try{
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
            format: format,
            html: getPrintedHtml(order),
          ),
          name: " فاتوره ${order.id}",
          format: PdfPageFormat.roll80);
    }catch(exception){
      //log(exception);
    }
    try{
      (await Printing.listPrinters()).forEach((element) {
        log("${element.name}");
        log("-----------");
      });
    }catch(e){
      log("${e.toString()}");
      log("========");
    }





    //Printing.convertHtml(html: '<html><body><p>Hello!</p></body></html>', format: PdfPageFormat.roll80);
    // var li = await Printing.listPrinters();
    // li.forEach((element) {
    //   log("${element.name}");
    //   log("----===-=-=-=-=-=");
    // });
    //bluetooth.printCustom("${t}",3,1);
    //bluetooth.printCustom('<html><body><p>Hello!</p></body></html>',3,1);
    base_bluetooth.paperCut();
  }

  getPrintedHtml(Order_AllPD order){

    String invoice = '''<!DOCTYPE html><html dir="rtl" lang="ar"><head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
    }

    th, td {
    text-align: right;
    padding: 8px;
    }
    h2 , h1{
    text-align: center;
    }

    tr:nth-child(even){background-color: #f2f2f2}
    </style>
    </head>
    <body>
    <img src="https://api.qimmajomla.com/public/images/1.jfif" height = "200" width = "200">
    <h1>مؤسسة قمة الجملة</h1>
    <h2>فاتورة مبيعات</h2>
    <div style="overflow-x:auto;">
    <table >
    <tr>
    <th>رقم الفاتورة : </th>
    <td>${order.id}</td>
    </tr>
    <tr>
        <th>الرقم الضريبي</th>
        <td>302156083100003</td>
    </tr>
    <tr>
        <th>السجل التجاري</th>
        <td>4031216509</td>
    </tr>
    <tr>
    <th>التاريخ : </th>
    <td>${order.date.split("T")[0] } </td>
    </tr>
    <tr>
    <th>اسم المندوب</th>
    <td>${order.representativeName}</td>
    </tr>
    <tr>
    <th>اسم العميل</th>
    <td>${order.name}</td>
    </tr>
    </table>
    </div>
    <div/>
    <h2></h2>
    <div style="overflow-x:auto;">
    <table>
    <tr>
    <th>اسم المنتج</th>
    <th>العدد</th>
    <th>النوع</th>
    <th>سعر القطعة</th>
    <th>المجموع</th>
    </tr>
    ${getPrintetedProducts(order)}
    </table>
    </div>
    <h2></h2>
    <div style="overflow-x:auto;" margin="10">
    <table >
    <tr>
    <th>نوع الدفع</th>
    <td>${order.rest == 0? "كاش": "اجل"}</td>
    </tr>
    <tr>
    <th>الخصم</th>
    <td>${order.discount}</td>
    </tr>
    <tr>
    <th>الضريبة</th>
    <td>${order.tax1}</td>
    </tr>
    <tr>
    <th>رسوم اخري</th>
    <td>${order.tax2}</td>
    </tr><tr>
    <th>الاجمالي</th>
    <td>${order.totalPrice}</td>
    </tr>
    <tr>
    <th>المدفوع</th>
    <td>${order.paid}</td>
    </tr>
    
    </table>
    
    <h2>-----------------------</h2>
    <div>
    <table >
     
      <tr>
        <th>المركز الرئيسي / مكه المكرمه</th>
        <td></td>
      </tr>
       
      <tr>
        <th>للشكاوي والمقترحات</th>
        <td>0566761934</td>
      </tr>
    </table>
    </div>
    </div><div/></body></html>''';

    return invoice;
  }
  getPrintetedProducts(Order_AllPD order){
    String productsHTML = "";
    order.products.forEach((element) {
      productsHTML += '''
    <tr>
      <td>${element?.Difference?? ''}</td>
      <td>${element?.quantity ?? ''}</td>
      <td>${element?.size?.name ?? ''}</td>
      <td>${(element?.price ??  '')}</td>
      <td>${(element?.price ?? 0 * element?.quantity ?? 0) ?? ''}</td>
    </tr>
    ''';
    });
    return productsHTML;
  }
}
final printerBloc = PrinterBloc();