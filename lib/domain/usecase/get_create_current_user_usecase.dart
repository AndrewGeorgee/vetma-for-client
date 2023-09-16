import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';

import '../../data/models/new_model.dart';

class GetCreateCurrentUserUseCase {
  final VetmaRepositery repository;

  GetCreateCurrentUserUseCase(this.repository);

  Future<void> call(UserModel user) async {
    return await repository.getCreateCurrentUser(user);
  }
}
