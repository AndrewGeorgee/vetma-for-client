import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';

class VerifyOtpUsecase {
  final VetmaRepositery repository;

  VerifyOtpUsecase(this.repository);
  Future<void> call(String otp) {
    return repository.verifyOtp(otp);
  }
}
