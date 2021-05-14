import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/network/model/exercise_detail_dto.dart';

class ExerciseDetailConverter
    extends TypeConverter<List<ExerciseDetailDto>, String> {

  @override
  List<ExerciseDetailDto> decode(String databaseValue) {
    return (jsonDecode(databaseValue) as List)
        .map((value) => ExerciseDetailDto.fromJson(value))
        .toList();
  }

  @override
  String encode(List<ExerciseDetailDto> value) {
    return jsonEncode(value).toString();
  }

}
