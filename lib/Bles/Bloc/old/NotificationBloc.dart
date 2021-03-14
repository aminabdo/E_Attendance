import 'package:qimma/Bles/Model/Responses/old/notification/MyNotificationResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class NotificationBloc extends BaseBloc {

  BehaviorSubject<MyNotificationResponse> _get_notification = BehaviorSubject<MyNotificationResponse>();

  getNotifications() async {
    _get_notification.value = MyNotificationResponse();
    _get_notification.value.loading = true ;
    MyNotificationResponse response = MyNotificationResponse.fromMap((await repository.get(ApiRoutes.get_notification())).data);
    _get_notification.value = response;
    _get_notification.value.loading = false ;
  }

  BehaviorSubject<MyNotificationResponse> get notification => _get_notification;

}

final notificationBloc = NotificationBloc();