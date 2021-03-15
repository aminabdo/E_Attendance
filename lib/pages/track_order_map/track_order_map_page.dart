import 'package:flutter/material.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';

class TrackOrderMapPage extends StatefulWidget {
  @override
  _TrackOrderMapPageState createState() => _TrackOrderMapPageState();
}

class _TrackOrderMapPageState extends State<TrackOrderMapPage> {
  bool dropOff = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            elevation: 4,
            child: Container(
              width: size.width,
              height: size.height * .185,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    space(context),
                    MyAppBar(
                      text:
                          '${AppUtils.translate(context, 'id')}:  #298498656458',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/images/track_map.png').image,
                    ),
                  ),
                ),
                Positioned(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    elevation: 4,
                    child: Container(
                      width: size.width,
                      height: size.height * .12,
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppUtils.translate(context, 'distance'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '8 km',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppUtils.translate(context, 'estimate'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '15 min',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor,
                                  ),
                                ),
                              ],
                            ),
                            MyButton(
                              dropOff
                                  ? AppUtils.translate(context, 'drop_off')
                                  : AppUtils.translate(context, 'pickup'),
                              width: size.width * .25,
                              height: 40,
                              btnColor: dropOff ? Colors.red : mainColor,
                              onTap: () {
                                if (!dropOff) {
                                  dropOff = true;
                                  setState(() {});
                                } else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (_) => HomePage(),
                                      ),
                                      (route) => false);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  right: 10,
                  bottom: 100,
                  child: FloatingActionButton(
                    onPressed: () {},
                    heroTag: '${DateTime.now()}',
                    backgroundColor: mainColor,
                    child: Icon(
                      Icons.my_location,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
