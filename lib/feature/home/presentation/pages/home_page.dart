import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notification/feature/home/bloc/bloc/bloc_notification_bloc.dart';

class HomaPage extends StatelessWidget {
  const HomaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BlocNotificationBloc>().add(CreateNotification());
        },
        child: const Icon(Icons.notification_add),
      ),
    );
  }
}
