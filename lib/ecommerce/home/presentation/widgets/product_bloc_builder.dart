import 'package:ecommerce/ecommerce/home/presentation/bloc/product_by_categories_cubit.dart';
import 'package:ecommerce/ecommerce/home/presentation/widgets/product_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductByCategoriesCubit, ProductByCategoriesState>(
      buildWhen: (previous, current) {
        if (previous is Loaded && current is Loaded) {
          return previous.products != current.products;
        }
        return false;
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (products)=>ProductBuilder(
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
