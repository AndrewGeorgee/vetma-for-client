import 'package:vetma_final_project/data/models/new_model.dart';
import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';


class SignInUsecase {
  final VetmaRepositery repository;

  SignInUsecase(this.repository);
  Future< void> call(UserModel user) async {
    return await repository.signIn(user);
  }
}
