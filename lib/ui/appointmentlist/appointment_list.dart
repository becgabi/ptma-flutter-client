import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptma_flutter_client/di/di_config.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list_content.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list_cubit.dart';
import 'package:ptma_flutter_client/ui/ptma_drawer.dart';
import 'package:ptma_flutter_client/ui/util.dart';

const APPOINTMENT_LIST_PAGE = "/appointments";

class AppointmentListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Appointments"),
        ),
        drawer: PtmaDrawer(),
        body: BlocProvider(
          create: (_) => injector<AppointmentListCubit>()..findOwn(),
          child: BlocListener<AppointmentListCubit, AppointmentListState>(
            listener: (context, state) {
              if (state is Error) {
                context.centerProgressBar;
              }
            },
            child: BlocBuilder<AppointmentListCubit, AppointmentListState>(
                builder: (context, state) {
              if (state is Loading) {
                return context.centerProgressBar;
              } else if (state is ListReady) {
                return AppointmentListContent(state);
              }

              return Center(child: Text("An unexpected error occurred."));
            }),
          ),
        ));
  }
}
