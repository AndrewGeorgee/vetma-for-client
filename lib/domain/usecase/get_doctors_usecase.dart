import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';

class GetDoctorUsecase {
  final VetmaRepositery repository;

  GetDoctorUsecase(this.repository);
  Future<List<Doctors>> call() {
    return repository.getDoctors();
  }
}
