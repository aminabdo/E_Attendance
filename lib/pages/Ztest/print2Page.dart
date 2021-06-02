import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:qimma/Bles/Bloc/print/PrintBloc.dart';


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Print2Page extends StatefulWidget {
  @override
  _Print2PageState createState() => new _Print2PageState();
}

class _Print2PageState extends State<Print2Page> {

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  String pathImage;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initSavetoPath();
  }

  initSavetoPath()async{
    //read and write
    //image max 300px X 300px
    final filename = 'yourlogo.png';
    var bytes = await rootBundle.load("assets/images/person.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    setState(() {
      pathImage='$dir/$filename';
    });
  }


  Future<void> initPlatformState() async {
    bool isConnected=await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if(isConnected) {
      setState(() {
        _connected=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blue Thermal Printer'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Text(
                      'Device:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: DropdownButton(
                        items: _getDeviceItems(),
                        onChanged: (value) => setState(() => _device = value),
                        value: _device,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.brown,
                      onPressed:(){
                        initPlatformState();
                      },
                      child: Text('Refresh', style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 20,),
                    RaisedButton(
                      color: _connected ?Colors.red:Colors.green,
                      onPressed:
                      _connected ? _disconnect : _connect,
                      child: Text(_connected ? 'Disconnect' : 'Connect', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                  child:  RaisedButton(
                    color: Colors.brown,
                    onPressed:(){
                      _tesPrint();
                    },
                    child: Text('PRINT TEST', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }


  void _connect() {
    if (_device == null) {
      show('No device selected.');
    } else {
      printerBloc.connect(_device, bluetooth);
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(_device).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    }
  }


  void _disconnect() {
    printerBloc.disconnect(bluetooth);
    bluetooth.disconnect();
    setState(() => _connected = true);
  }

//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future show(
      String message, {
        Duration duration: const Duration(seconds: 3),
      }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        duration: duration,
      ),
    );
  }
  void _tesPrint() async {
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


        String page =
            "<!DOCTYPE html>"
        " <html>"
        "<head>"
            "<style>"
            "table, th, td {"
            " border: 1px solid black;"
            "border-collapse: collapse;"
            "}"
            "th, td {"
            "padding: 5px;"
            "text-align: left;"
            "}"
            "</style>"
        "</head>"
        "<body>"

        "<h2>فاتورة مبيعات</h2>"
        "<p>قمة الجملة</p>"

            "<table style=\"width:100%\">"
        "<caption>التفاصيل</caption>"
        "<tr>"
        "<th>المنتج</th>"
        "<th>السعر</th>"
        "</tr>"
        "<tr>"
        "<td>شاحن سامسونج</td>"
        "<td>١٠٠ ريال</td>"
    "</tr>"
    " <tr>"
    "<td>شاحن ايفون ٧</td>"
    "<td>٥٠ ريال</td>"
    "</tr>"
    "</table>"

    "</body>"
    "</html>";
        try{
          await Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
                format: format,
                html: page,
              ),
          name: "فاتوره ١",
          format: PdfPageFormat.roll80);
        }catch(exception){
          //log(exception);
        }
        // try{
        //   (await Printing.listPrinters()).forEach((element) {
        //     log("${element.name}");
        //     log("-----------");
        //   });
        // }catch(e){
        //   log(e);
        //   log("========");
        // }





    //Printing.convertHtml(html: '<html><body><p>Hello!</p></body></html>', format: PdfPageFormat.roll80);
    // var li = await Printing.listPrinters();
    // li.forEach((element) {
    //   log("${element.name}");
    //   log("----===-=-=-=-=-=");
    // });
    //bluetooth.printCustom("${t}",3,1);
    //bluetooth.printCustom('<html><body><p>Hello!</p></body></html>',3,1);
    bluetooth.paperCut();
  }
  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Placeholder(),
      ),
    );
    return pdf.save();
  }
  Future show1(
      String message, {
        Duration duration: const Duration(seconds: 3),
      }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        duration: duration,
      ),
    );
  }
}
