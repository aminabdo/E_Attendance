import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:qimma/Bles/Bloc/old/NotificationBloc.dart';
import 'package:qimma/Bles/Model/Responses/old/notification/MyNotificationResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_loader.dart';

class NotificationsPage extends StatefulWidget {

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final ScreenUtil screenUtil = ScreenUtil();

  @override
  initState() {
    super.initState();

    notificationBloc.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenUtil.setWidth(14.0)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              MyAppBar(
                text: AppUtils.translate(context, 'notifications'),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.top - screenUtil.setHeight(15),
              ),
              StreamBuilder<MyNotificationResponse>(
                stream: notificationBloc.notification.stream,
                builder: (context, snapshot) {
                  if(notificationBloc.notification.value.loading) {
                    return Column(
                      children: [
                        SizedBox(height: screenUtil.screenWidth / 2,),
                        Loader(),
                        SizedBox(height: screenUtil.screenWidth / 2,),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: screenUtil.setHeight(10),
                            bottom: screenUtil.setHeight(10),
                            left: index % 2 == 0 ? screenUtil.setWidth(50) : screenUtil.setWidth(5),
                            right: index % 2 == 1 ? screenUtil.setWidth(50) : screenUtil.setWidth(5),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(.7, .7),
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenUtil.setWidth(5)),
                            child: ListTile(
                              leading: index % 2 == 0 ? Image.asset('assets/images/logo.png') : null,
                              trailing: index % 2 == 1 ? Image.asset('assets/images/logo.png') : null,
                              title: Text(
                                snapshot.data.data[index].name,
                                style: TextStyle(fontSize: screenUtil.setSp(15)),
                              ),
                              subtitle: Text(
                                snapshot.data.data[index].desc,
                                style: TextStyle(fontSize: screenUtil.setSp(12)),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data.data.length,
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
