part of 'bloc_notification_bloc.dart';

@immutable
sealed class BlocNotificationState {}

final class BlocNotificationInitial extends BlocNotificationState {}

final class NotificationInitialized extends BlocNotificationState {}

final class NotificationCreated extends BlocNotificationState {}

final class NotificationListenersSet extends BlocNotificationState {}
