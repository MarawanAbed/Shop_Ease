import 'package:ecommerce/ecommerce/search/presentation/bloc/search_cubit.dart';
import 'package:ecommerce/ecommerce/search/presentation/widgets/search_list_view.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key, required this.language});
  final String language;
  @override
  Widget build(BuildContext context) {
    var s=S.of(context);
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.when(
          initial: () =>  Expanded(
            child: Center(
              child: Text(s.search_products),
            ),
          ),
          loading: () => const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          success: (products) => products.isEmpty
              ?  Expanded(
                  child: Center(
                    child: Text(s.no_products_found),
                  ),
                )
              : SearchListView(
                  language: language,
                  products: products,
                ),
          error: (message) => Expanded(
            child: Center(
              child: Text(message),
            ),
          ),
        );
      },
    );
  }
}
