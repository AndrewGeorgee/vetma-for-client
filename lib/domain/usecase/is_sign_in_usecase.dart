import '../repositery/vetma_repositery.dart';

class IsSignInUseCase {
  final VetmaRepositery repository;

  IsSignInUseCase(this.repository);

  Future<bool> call() {
    return repository.isSignIn();
  }
}
