import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';

class GetCreateCurrentDocotrUseCase {
  final VetmaRepositery repository;

  GetCreateCurrentDocotrUseCase(this.repository);

  Future<void> call(Doctors doctors) async {
    return await repository.getCreateCurrentDoctor(doctors);
  }
}
