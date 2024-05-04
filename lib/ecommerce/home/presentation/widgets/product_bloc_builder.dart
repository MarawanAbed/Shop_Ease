import 'package:ecommerce/ecommerce/home/presentation/bloc/product_by_categories_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/home_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key, required this.language});
  final String language;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductByCategoriesCubit>();
    return BlocConsumer<ProductByCategoriesCubit, ProductByCategoriesState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Loaded || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loaded: (products) {
            cubit.products = products;
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (products) =>
              HomeProductsListView(
                products: cubit.products,
                language: language,
              ),
          error: (message) =>
              Center(
                child: Text(message),
              ),
        );
      },
    );
  }
}
