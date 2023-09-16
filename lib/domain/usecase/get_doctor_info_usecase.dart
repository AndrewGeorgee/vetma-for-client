import 'package:vetma_final_project/data/models/doctor_model.dart';

import '../repositery/vetma_repositery.dart';

class GetDoctorInfUSecase {
  final VetmaRepositery repository;

  GetDoctorInfUSecase(this.repository);
  Stream<Doctors> call(String uid) {
    return repository.getDoctorInfStream(uid);
  }
}