import '../repositery/vetma_repositery.dart';

class GetInformmationUserDatabaseUsecase {
  final VetmaRepositery repository;

  GetInformmationUserDatabaseUsecase(this.repository);

  Future<void> call(String uid) async {
    return repository.getInformationUserFromFireBase(uid);
  }
}
