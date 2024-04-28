import '../../../../../core/usecases/use_cases.dart';
import '../repositories/forget_repo.dart';

class ForgetPassword implements UseCase<Future<void>, String>
{
  final ForgetRepo repo;

  ForgetPassword({required this.repo});

  @override
  Future<void> call([String? parameter])async {
    return await repo.forgetPassword(parameter!);
  }


}