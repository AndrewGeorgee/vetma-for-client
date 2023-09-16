
import '../repositery/vetma_repositery.dart';

class SignOutUseCase {
  final VetmaRepositery repository;

  SignOutUseCase(this.repository);

  Future< void> call() async {
    return repository.signOut();
  }
}
