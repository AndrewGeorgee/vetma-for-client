import '../../data/models/reservation_details_entites.dart';
import '../repositery/vetma_repositery.dart';

class SaveReservationDetailsUSeCAse {
  final VetmaRepositery repository;

  SaveReservationDetailsUSeCAse(this.repository);

  Future<void> call(ReservationDetailsModel detailsEntites) async {
    return await repository.saveReservationDetails(detailsEntites);
  }
}
