import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptma_flutter_client/di/di_config.dart';
import 'package:ptma_flutter_client/ui/ptma_drawer.dart';
import 'package:ptma_flutter_client/ui/util.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_list_content.dart';

import 'workout_list_cubit.dart';

class WorkoutListPage extends StatelessWidget {
  static const routeName = "/workouts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workouts"),
      ),
      drawer: PtmaDrawer(),
      body: BlocProvider(
        create: (_) => injector<WorkoutListCubit>()..findAll(),
        child: BlocListener<WorkoutListCubit, WorkoutListState>(
          listener: (context, state) {
            if (state is Error) {
              context.errorOccurred;
            }
          },
          child: BlocBuilder<WorkoutListCubit, WorkoutListState>(
              builder: (context, state) {
            if (state is Loading) {
              return context.centerProgressBar;
            } else if (state is ListReady) {
              if (state.workouts.isEmpty) {
                return context.emptyList;
              } else {
                return WorkoutListContent(state);
              }
            }

            return context.errorOccurred;
          }),
        ),
      ),
    );
  }
}
