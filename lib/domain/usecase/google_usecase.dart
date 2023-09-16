import '../repositery/vetma_repositery.dart';

class GoogleSignInUseCase {
  final VetmaRepositery repository;

  GoogleSignInUseCase(this.repository);

  Future<void> call() {
    return repository.googleAuth();
  }
}
