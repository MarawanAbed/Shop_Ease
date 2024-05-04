import 'package:ecommerce/core/widgets/app_text_form.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/get_single_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountBlocBuilder extends StatefulWidget {
  const MyAccountBlocBuilder({super.key, required this.emailController, required this.passwordController, required this.nameController, required this.addressController, required this.phoneController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  @override
  State<MyAccountBlocBuilder> createState() => _MyAccountBlocBuilderState();
}

class _MyAccountBlocBuilderState extends State<MyAccountBlocBuilder> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const CircularProgressIndicator(),
          loading: () => const CircularProgressIndicator(),
          loaded: (user) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                hintText: user.email,
                controller: widget.emailController,
                inputTextStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                hintText: user.password,
                controller: widget.passwordController,
                inputTextStyle: const TextStyle(
                  color: Colors.black,
                ),
                isObscureText: _obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                controller: widget.nameController,
                hintText: user.name,
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                controller: widget.addressController,
                inputTextStyle: const TextStyle(
                  color: Colors.black,
                ),
                hintText: user.address,
              ),
              const SizedBox(height: 16),
              const Text(
                'Phone',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                controller: widget.phoneController,
                hintText: user.phone,
                inputTextStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
          error: (message) => Text(message),
        );
      },
    );
  }
}