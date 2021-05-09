import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ptma_flutter_client/data/network/model/appointment_min_dto.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list_cubit.dart';
import 'package:ptma_flutter_client/ui/util.dart';

class AppointmentListContent extends StatefulWidget {
  final ListReady state;

  AppointmentListContent(this.state);

  @override
  _AppointmentListContentState createState() =>
      _AppointmentListContentState(state);
}

class _AppointmentListContentState extends State<AppointmentListContent> {
  ListReady state;
  late Completer _refreshCompleter;

  _AppointmentListContentState(this.state);

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentListCubit, AppointmentListState>(
      listener: (_, state) {
        if (state is ListReady) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<AppointmentListCubit>(context).findOwn();
          return _refreshCompleter.future;
        },
        child: ListView.builder(
          itemCount: state.appointments.length,
          itemBuilder: (context, index) {
            final item = state.appointments[index];
            return InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    item.locationName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(item.trainerName),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  describeEnum(item.status).capitalize,
                                  style: TextStyle(
                                      color: _getStatusColor(item.status)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(_getDate(item.start)),
                                ),
                                Text(_getTimeRange(item.start, item.end)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                    height: 4,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.CANCELED:
        return Colors.red;
      case AppointmentStatus.ACCEPTED:
        return Colors.lightGreen;
      case AppointmentStatus.REQUESTED:
        return Colors.black54;
    }
  }

  String _getDate(DateTime start) {
    return DateFormat("yyyy. MM. dd.").format(start);
  }

  String _getTimeRange(DateTime startDate, DateTime endDate) {
    String start = DateFormat("HH:mm").format(startDate);
    String end = DateFormat("HH:mm").format(endDate);
    return "$start - $end";
  }
}
