import 'package:flutter/material.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';

class ExerciseListContent extends StatelessWidget {
  final Workout workout;

  ExerciseListContent(this.workout);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: workout.exercises.length,
        itemBuilder: (context, index) {
          final item = workout.exercises[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(flex: 4, child: Text(item.exercise.name)),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("${item.duration} min"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(item.exercise.description),
                  ),
                ),
              ),
              Divider(
                color: Colors.black38,
                height: 4,
              )
            ],
          );
        },
      ),
    );
  }
}
