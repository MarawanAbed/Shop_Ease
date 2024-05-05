import 'package:ecommerce/core/di/dependancy_injection.dart';
import 'package:ecommerce/ecommerce/categories/presentation/bloc/category_cubit.dart';
import 'package:ecommerce/ecommerce/translate/presentation/bloc/translate/translate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/categories_body.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late String language;

  @override
  void initState() {
    language = context.read<LocalCubit>().state.language;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                getIt<CategoryCubit>()..getCategories(language),
            child:  CategoriesBody(
              language: language,
            ),
          ),
        ),
      ),
    );
  }
}
