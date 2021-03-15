import 'package:flutter/material.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_button2.dart';
import 'package:qimma/widgets/my_circle_btn.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: SingleChildScrollView(
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
                      actions: [
                        MuCircleButton(
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    MyTextFormField(
                      hintText:
                          AppUtils.translate(context, 'search_for_product'),
                      prefixIcon: Image.asset('assets/images/search.png'),
                    ),
                    space(context),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Item();
              },
              itemCount: 12,
            ),
          ],
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

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/shampo.png',
              scale: .45,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VinMart',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Women Health and Beauty',
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      MyButton2(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          if (counter != 0) {
                            counter--;
                            setState(() {});
                          }
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
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          counter++;
                          setState(() {});
                        },
                        width: 40,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '200 ${AppUtils.translate(context, 'eg')}',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: mainColor,
                      ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '250g',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                MyButton(
                  '${AppUtils.translate(context, 'add')}',
                  onTap: () {},
                  width: 50,
                  height: 35,
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
