import 'package:vetma_final_project/data/models/doctor_model.dart';

import '../repositery/vetma_repositery.dart';

class SignUpDocotrUseCase {
  final VetmaRepositery repository;

  SignUpDocotrUseCase(this.repository);

  Future<void> call(Doctors doctors) async {
    return await repository.signUpDoctor(doctors);
  }
}
