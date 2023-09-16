import 'package:vetma_final_project/domain/repositery/vetma_repositery.dart';

class GetCurrentUIDUseCase {
  final VetmaRepositery repository;

  GetCurrentUIDUseCase(this.repository);
  Future<String> call() async {
    return await repository.getCurrentUId();
  }
}
