import '../repositery/vetma_repositery.dart';

class GetInformmationDoctorDatabaseUsecase {
  final VetmaRepositery repository;

  GetInformmationDoctorDatabaseUsecase(this.repository);

  Future<void> call(String uid) async {
    return repository.getInformationDoctorFromFireBase(uid);
  }
}
