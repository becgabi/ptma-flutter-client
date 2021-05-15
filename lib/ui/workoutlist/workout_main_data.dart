import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ptma_flutter_client/domain/model/workout.dart';
import 'package:ptma_flutter_client/ui/util.dart';

class WorkoutMainData extends StatelessWidget {
  final Workout item;

  const WorkoutMainData({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.id,
      child: Material(
        textStyle: TextStyle(color: Colors.black54, fontSize: 16),
        child: Container(
          color: Color(0xFFECF5FB),
          child: Row(
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
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                      child: Text("${item.sumDuration} min"),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
}
