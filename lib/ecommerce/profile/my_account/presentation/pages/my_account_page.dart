import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/core/helpers/cache.dart';
import 'package:ecommerce/core/helpers/helper_methods.dart';
import 'package:ecommerce/core/services/firebase_servies.dart';
import 'package:ecommerce/core/services/navigator.dart';
import 'package:ecommerce/ecommerce/profile/my_account/presentation/bloc/get_single_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/routes.dart';
import '../widgets/my_account_bloc_builder.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  void initState() {
    context.read<GetSingleUserCubit>().getSingleUser();
    super.initState();
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: ()async {
              var cubit = context.read<GetSingleUserCubit>();
              var uId = getIt<AuthService>().getCurrentUserId();
              String dataSource = await getIt<SharedPreCacheHelper>()
                  .getData(key: 'dataSource_$uId')??'';
              if (dataSource == 'local') {
                Navigators.pushNamed(Routes.editProfile,arguments: cubit.myAccountModel);
              } else {
                HelperMethod.showErrorToast(
                  'You can\'t access the "My Account" page because you are logged in with a method that doesn\'t allow data editing, such as GitHub, Google, or Twitter. Please log in with email and password to access this page.',
                );
              }
            },
          ),
        ],
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              MyAccountBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}


