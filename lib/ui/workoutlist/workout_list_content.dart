import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptma_flutter_client/ui/workoutdetail/workout_detail.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_list_cubit.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_main_data.dart';

class WorkoutListContent extends StatefulWidget {
  final ListReady state;

  WorkoutListContent(this.state);

  @override
  _WorkoutListContentState createState() => _WorkoutListContentState(state);
}

class _WorkoutListContentState extends State<WorkoutListContent> {
  ListReady state;
  late Completer _refreshCompleter;

  _WorkoutListContentState(this.state);

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutListCubit, WorkoutListState>(
      listener: (_, state) {
        if (state is ListReady) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<WorkoutListCubit>(context).findAll();
          return _refreshCompleter.future;
        },
        child: ListView.builder(
          itemCount: state.workouts.length,
          itemBuilder: (context, index) {
            final item = state.workouts[index];
            return InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: WorkoutMainData(item: item),
                      onTap: () => Navigator.pushNamed(
                        context,
                        WorkoutDetailPage.routeName,
                        arguments: item,
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
}
