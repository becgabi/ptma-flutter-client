import 'package:flutter/material.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';
import 'package:ptma_flutter_client/ui/workoutdetail/exercise_list_content.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_main_data.dart';

class WorkoutDetailPage extends StatelessWidget {
  static const routeName = "/workout-detail";

  @override
  Widget build(BuildContext context) {
    final workout = ModalRoute.of(context)!.settings.arguments as Workout;
    return Scaffold(
      appBar: AppBar(
        title: Text("Workouts"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(title: WorkoutMainData(item: workout)),
          ),
          ExerciseListContent(workout),
        ],
      ),

      /*
      This is not working due to random flutter error
      BlocProvider(
        create: (_) => injector<WorkoutDetailCubit>()..getOne(workoutId),
        child: BlocListener<WorkoutDetailCubit, WorkoutDetailState>(
          listener: (context, state) {
            if (state is Error) {
              context.errorOccurred;
            }
          },
          child: BlocBuilder<WorkoutDetailCubit, WorkoutDetailState>(
              builder: (context, state) {
            if (state is Loading) {
              return context.centerProgressBar;
            } else if (state is NotFound) {
              return context.errorOccurred;
            } else if (state is DataReady) {
              // return WorkoutMainData(item: state.workout);
              return context.errorOccurred;
            }

            return context.errorOccurred;
          }),
        ),
      ),*/
    );
  }
}
