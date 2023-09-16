import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';

class VerifyPhoneNumberUsecase {
  final VetmaRepositery repository;

  VerifyPhoneNumberUsecase(this.repository);
  Future<void> call(String phoneNumber) {
    return repository.verifyPhoneNumber(phoneNumber);
  }
}
