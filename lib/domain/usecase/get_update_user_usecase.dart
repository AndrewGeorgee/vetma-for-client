import 'package:vetma_final_project/data/models/new_model.dart';

import '../repositery/vetma_repositery.dart';

class GetUpdateUserUseCase {
  final VetmaRepositery repository;

  GetUpdateUserUseCase(this.repository);
  Future<void> call(UserModel user) {
    return repository.getUpdateUser(user);
  }
}
