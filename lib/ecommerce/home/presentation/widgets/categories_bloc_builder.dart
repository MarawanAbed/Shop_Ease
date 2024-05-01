import 'package:ecommerce/ecommerce/home/presentation/bloc/categories_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/categories_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) {
        if(previous is Loaded && current is Loaded){
          return previous.categories != current.categories;
        }
        return false;
      },
      builder: (context, state) {
        return state.when(
          initial: ()=> const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (categories)=>CategoriesBuilder(categories: categories),
          error: (message) => Center(child: Text(message)),
        );
      },
    );
  }
}
