import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/profile/my_account/domain/repositories/my_account_repo.dart';

class UpdateEmailAndPassword
    extends UseCaseThreeParams<Future<void>, String, String, String> {
  final MyAccountRepo myAccountRepo;

  UpdateEmailAndPassword(this.myAccountRepo);

  @override
  Future<void> call([String? param1, String? param2, String? param3]) async {
    return await myAccountRepo.updateEmailAndPassword(
        param1!, param2!, param3!);
  }
}
