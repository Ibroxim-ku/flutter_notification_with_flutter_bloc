import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notification/core/controller/notification_controller.dart';

part 'bloc_notification_event.dart';
part 'bloc_notification_state.dart';

class BlocNotificationBloc
    extends Bloc<BlocNotificationEvent, BlocNotificationState> {
  BlocNotificationBloc() : super(BlocNotificationInitial()) {
    on<BlocNotificationEvent>((event, emit) async {
      await _initializeNotifications();
      emit(NotificationInitialized());
    });

    on<CreateNotification>((event, emit) {
      _createNotification();
      emit(NotificationCreated());
    });

    on<SetNotificationListeners>((event, emit) {
      _setNotificationListeners();
      emit(NotificationListenersSet());
    });
  }

  Future<void> _initializeNotifications() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: "basic_channel_group",
          channelKey: "basic_channel",
          channelName: "Basic Notification",
          channelDescription: "Basic notifications channel",
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: "basic_channel_group",
          channelGroupName: "Basic Group",
        )
      ],
    );

    bool isAllowedToSendNotification =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowedToSendNotification) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  void _createNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "basic_channel",
        title: "Hello world!",
        body: "A fiery greeting from @Ibroxim-ku",
      ),
    );
  }

  void _setNotificationListeners() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }
}
