import 'package:flutter/material.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_text_form_field.dart';
class SetDeptPage extends StatefulWidget {
  @override
  _SetDeptPageState createState() => _SetDeptPageState();
}

class _SetDeptPageState extends State<SetDeptPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: Column(
        children: [
          Container(
            height: statusBarHeight + 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: MyAppBar(
                text:
                "${AppUtils.translate(context, 'set_dept_page_title')}",
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                    child: MyTextFormField(
                      label: '${AppUtils.translate(context, 'set_dept_page_amount')}',
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: googleColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                            child: Text('${AppUtils.translate(context, 'set_dept_page_subtraction')}', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                            child: Text('${AppUtils.translate(context, 'set_dept_page_addition')}' , style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
