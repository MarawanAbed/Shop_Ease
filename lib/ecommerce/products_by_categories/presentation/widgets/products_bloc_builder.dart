import 'package:ecommerce/ecommerce/products_by_categories/presentation/bloc/porducts_by_categories_cubit.dart';
import 'package:ecommerce/ecommerce/products_by_categories/presentation/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBLocBuilder extends StatelessWidget {
  const ProductsBLocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsByCategoriesCubit, ProductsByCategoriesState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Loaded || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (products) => ProductsListView(
            products: products,
          ),
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
