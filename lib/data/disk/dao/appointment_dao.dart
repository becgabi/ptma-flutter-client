import 'package:floor/floor.dart';
import 'package:ptma_flutter_client/data/disk/model/floor_appointment.dart';

@dao
abstract class AppointmentDao {

  @Query("SELECT * FROM appointment")
  Future<List<FloorAppointment>?> findAll();

  @Insert()
  Future<void> insert(List<FloorAppointment> appointments);

  @Query("DELETE FROM appointment")
  Future<void> deleteAll();
}
