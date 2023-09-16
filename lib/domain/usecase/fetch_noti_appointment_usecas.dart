import '../../data/models/reservation_details_entites.dart';
import '../repositery/vetma_repositery.dart';

class FetchNotficationAppointmentOfDoctorUsecase {
  final VetmaRepositery repository;

  FetchNotficationAppointmentOfDoctorUsecase(this.repository);
Future<List<ReservationDetailsModel>> call(String id) async {
    return await repository.fetchNotifAppoinntmentToShow(id);
  }
}