import '../repositery/vetma_repositery.dart';

class ForgetPassword {
  final VetmaRepositery repository;

  ForgetPassword(this.repository);
  Future<void> call(String email) async {
    return await repository.forgetPassword(email);
  }
}
