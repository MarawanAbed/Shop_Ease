import 'package:ecommerce/core/usecases/use_cases.dart';
import 'package:ecommerce/ecommerce/auth/register/data/models/customer_model.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/repositories/register_repo.dart';

class CreateCustomer implements UseCase<Future<CustomerModel>,CustomerModel>
{
  final RegisterRepo _registerRepo;

  CreateCustomer({required RegisterRepo registerRepo}) : _registerRepo = registerRepo;
  @override
  Future<CustomerModel> call([CustomerModel? parameter])async {
    return await _registerRepo.createCustomer(parameter!);
  }

}