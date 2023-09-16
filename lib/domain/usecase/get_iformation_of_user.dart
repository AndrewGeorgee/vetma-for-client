import '../../data/models/new_model.dart';
import '../repositery/vetma_repositery.dart';

class GetInformationTextUSecase {
  final VetmaRepositery repository;

  GetInformationTextUSecase(this.repository);
  Stream<UserModel> call(String uid) {
    return repository.getUserInfStream(uid);
  }
}
