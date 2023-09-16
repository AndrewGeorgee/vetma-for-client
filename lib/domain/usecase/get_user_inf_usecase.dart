import '../../data/models/new_model.dart';
import '../repositery/vetma_repositery.dart';

class GetUserInformationUsecase {
  final VetmaRepositery repository;

  GetUserInformationUsecase(this.repository);
  Future<UserModel> call(String id) async {
    return await repository.getInformationUser(id);
  }
}
