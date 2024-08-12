part of 'bloc_notification_bloc.dart';

@immutable
sealed class BlocNotificationEvent {}

class InitializeNotifications extends BlocNotificationEvent {}

class CreateNotification extends BlocNotificationEvent {}

class SetNotificationListeners extends BlocNotificationEvent {}
