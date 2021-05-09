import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/network/model/appointment_min_dto.dart';

class AppointmentStatusConverter
    extends TypeConverter<AppointmentStatus, String> {
  @override
  AppointmentStatus decode(String databaseValue) {
    return AppointmentStatus.values
        .firstWhere((e) => e.toString() == databaseValue);
  }

  @override
  String encode(AppointmentStatus value) {
    return value.toString();
  }
}
