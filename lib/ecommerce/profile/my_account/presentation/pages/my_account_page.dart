import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/my_account_bloc_builder.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;

  @override
  void initState() {
    var cubit = context.read<UpdateUserDataCubit>();
    emailController = cubit.emailController;
    passwordController = cubit.passwordController;
    nameController = cubit.nameController;
    addressController = cubit.addressController;
    phoneController = cubit.phoneController;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: context.read<UpdateUserDataCubit>().formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                MyAccountBlocBuilder(
                  emailController: emailController,
                  passwordController: passwordController,
                  nameController: nameController,
                  addressController: addressController,
                  phoneController: phoneController,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        var cubit = context.read<UpdateUserDataCubit>();
                        if (cubit.formKey.currentState!.validate()) {
                          print("${cubit.emailController}");
                          print("${cubit.passwordController}");
                          print("${cubit.nameController}");
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
// child: Column
// (
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text(
// 'Email',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// TextFormField(
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your email';
// }
// return null;
// },
// onChanged: (value) {
// setState(() {
// _email = value;
// });
// },
// initialValue: 'you@example.com',
// decoration: const InputDecoration(
// hintText: 'you@example.com',
// ),
// ),
// const SizedBox(height: 16),
// const Text(
// 'Password',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// TextFormField(
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your password';
// }
// return null;
// },
// onChanged: (value) {
// setState(() {
// _password = value;
// });
// },
// initialValue: 'password',
// decoration: const InputDecoration(
// hintText: 'password',
// ),
// obscureText: true,
// ),
// const SizedBox(height: 16),
// const Text(
// 'Name',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// TextFormField(
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your name';
// }
// return null;
// },
// onChanged: (value) {
// setState(() {
// _name = value;
// });
// },
// initialValue: 'John Doe',
// decoration: const InputDecoration(
// hintText: 'John Doe',
// ),
// ),
// const SizedBox(height: 16),
// const Text(
// 'Address',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// TextFormField(
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your address';
// }
// return null;
// },
// onChanged: (value) {
// setState(() {
// _address = value;
// });
// },
// initialValue: '123 Main St',
// decoration: const InputDecoration(
// hintText: '123 Main St',
// ),
// ),
// const SizedBox(height: 16),
// const Text(
// 'Phone',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// TextFormField(
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter your phone number';
// }
// return null;
// },
// onChanged: (value) {
// setState(() {
// _phone = value;
// });
// },
// initialValue: '555-555-5555',
// decoration: const InputDecoration(
// hintText: '555-555-5555',
// ),
// ),
// const SizedBox(height: 32),
// Center(
// child: ElevatedButton(
// onPressed: () {
// if (_formKey.currentState!.validate()) {
// // TODO: Implement your functionality to save the user account data
// }
// },
// child: const Text('Save'),
// ),
// ),
// ],
// ),
// ),
// )
// ,
