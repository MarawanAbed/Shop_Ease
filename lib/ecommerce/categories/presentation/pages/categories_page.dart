import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/ecommerce/categories/presentation/bloc/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/categories_body.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) => getIt<CategoryCubit>()..getCategories(),
            child: const CategoriesBody(),
          ),
        ),
      ),
    );
  }
}
