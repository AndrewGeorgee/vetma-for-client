import '../../data/models/new_model.dart';
import '../repositery/vetma_repositery.dart';

class SignUpAsDoctorUseCase {
  final VetmaRepositery repository;

  SignUpAsDoctorUseCase(this.repository);

  Future<void> call(UserModel user) async {
    return await repository.signUp(user);
  }
}
