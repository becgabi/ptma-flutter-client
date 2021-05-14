import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';
import 'package:ptma_flutter_client/ui/util.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_list_cubit.dart';

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
                      title: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    item.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Wrap(
                                  children: _buildMuscleGroups(item),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text("${_getSumDuration(item)} min"),
                                ),
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

  List<Padding> _buildMuscleGroups(Workout item) {
    return item.exercises
        .expand((exercise) => exercise.exercise.muscleGroups)
        .toSet()
        .map((muscleGroup) => Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2.0),
              child: Chip(
                label: Text(describeEnum(muscleGroup).capitalize),
              ),
            ))
        .toList();
  }

  int _getSumDuration(Workout item) {
    return item.exercises.fold(0, (sum, exercise) => sum + exercise.duration);
  }
}
