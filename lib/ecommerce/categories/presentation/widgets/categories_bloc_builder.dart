import 'package:ecommerce/ecommerce/categories/presentation/bloc/category_cubit.dart';
import 'package:ecommerce/ecommerce/categories/presentation/widgets/categories_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key, required this.language});

  final String language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (categories) => CategoriesGridView(
            categories: categories,
            language: language,
          ),
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
