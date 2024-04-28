import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/ecommerce/auth/register/data/models/customer_model.dart';
import 'package:ecommerce/ecommerce/auth/register/data/models/user_model.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/use_cases/create_customer.dart';
import 'package:ecommerce/ecommerce/auth/register/domain/use_cases/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/create_user.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._signUp, this._createUser, this._createCustomer)
      : super(const RegisterState.initial());

  final SignUp _signUp;
  final CreateUser _createUser;

  final CreateCustomer _createCustomer;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final enterYourPhoneController = TextEditingController();
  final enterYourAddressController = TextEditingController();


  void signUpWithEmailAndPassword() async {
      emit(const RegisterState.loading());
      try {
        await _signUp(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        await createUser(
          UserModel(
            email: emailController.text.trim(),
            name: nameController.text.trim(),
            phone: enterYourPhoneController.text.trim(),
            address: enterYourAddressController.text.trim(),
            uId: null,
            password: passwordController.text.trim(),
            image: null,
            dataSource: 'local',
          ),
        );
        final customerData=await createCustomer(
          CustomerModel(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phone: enterYourPhoneController.text.trim(),
          ),
        );
        print('Customer ID: ${customerData.id}');
        await getIt<SharedPreCacheHelper>().setCustomerId(customerData.id!);
        emit( const RegisterState.success());
      } catch (e) {
        emit(RegisterState.error(e.toString()));
      }
  }

  Future<void> createUser(UserModel user) async {
    emit(const RegisterState.loading());
    try {
      await _createUser(user);
    } catch (e) {
      emit(RegisterState.error(e.toString()));
    }
  }

  Future<CustomerModel> createCustomer(CustomerModel customer) async {
    emit(const RegisterState.loading());
    try {
      return await _createCustomer(customer);
    } catch (e) {
      emit(RegisterState.error(e.toString()));
      return CustomerModel(id: null, name: '', email: '', phone: '');
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    enterYourPhoneController.dispose();
    enterYourAddressController.dispose();
    return super.close();
  }

}
