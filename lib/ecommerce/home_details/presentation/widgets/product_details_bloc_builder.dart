import 'package:ecommerce/ecommerce/home_details/presentation/bloc/product_details_cubit.dart';
import 'package:ecommerce/ecommerce/home_details/presentation/widgets/product_details_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBlocBuilder extends StatelessWidget {
  const ProductDetailsBlocBuilder({super.key, required this.language});
  final String language;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            success: (product) => ProductDetailsItems(
                  product: product,
                  language: language,
                ),
            error: (message) => Center(
                  child: Text(message),
                ));
      },
    );
  }
}
