import 'package:vetma_final_project/data/models/doctor_model.dart';

import '../repositery/vetma_repositery.dart';

class SigninAsDoctorUseCase {
  final VetmaRepositery repository;

  SigninAsDoctorUseCase(this.repository);

  Future<void> call(Doctors doctors) async {
    return await repository.signInAsDoctor(doctors);
  }
}
